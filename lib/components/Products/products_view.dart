import 'package:flutter/material.dart';
import 'package:senaonprintingmovil/components/Products/products_details_page.dart';

import '../Products/products_data.dart';


class ProductsView extends StatefulWidget {
  @override
  _ProductsViewState createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  late Future<List<Map<String, dynamic>>> ProductData;

  @override
  void initState() {
    super.initState();
    // Inicializa la carga de datos cuando se crea la vista
    ProductData = fetchProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        // Utiliza la variable ProductData que contiene los datos de la API
        future: ProductData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras se obtienen los datos
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Muestra un mensaje de error si no se pueden obtener los datos
            return Center(child: Text('Error al cargar los datos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Muestra un mensaje si no hay datos disponibles
            return Center(child: Text('No se encontraron Productos'));
          } else {
            // Muestra la lista de Productes obtenida de la API
            final ProductData = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  ProductData.length,
                  (index) => ProductCard(
                    ProductData: ProductData[index],
                    onTap: () {
                      _showProductDetails(context, index);
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _showProductDetails(BuildContext context, int index) async {
  final data = await ProductData; // Esperar a que ProductData se resuelva
  showModalBottomSheet(
    context: context,
    builder: (context) => ProductsDetailsPage(
    productsData: data[index],
    ),
  );
}
}
class ProductCard extends StatelessWidget {
  final Map<String, dynamic> ProductData;
  final VoidCallback onTap;

  ProductCard({
    required this.ProductData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool statedAt = ProductData['statedAt'];

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 6,
              height: 80,
              color: statedAt ? Colors.green : Colors.red,
            ),
            SizedBox(width: 12),
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Icon(
                Icons.person_rounded,
                size: 56,
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ProductData['name'],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
