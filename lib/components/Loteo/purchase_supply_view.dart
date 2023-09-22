import 'package:flutter/material.dart';
import 'purchase_supply_data.dart';
import 'purchase_supply_details.dart';

class supplysDetailsView extends StatefulWidget {
  @override
  _supplysDetailsViewState createState() => _supplysDetailsViewState();
}

class _supplysDetailsViewState extends State<supplysDetailsView> {
  late Future<List<Map<String, dynamic>>> compraInsumosData;

  @override
  void initState() {
    super.initState();
    // Inicializa la carga de datos cuando se crea la vista
    compraInsumosData = fetchsupplyDetailsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compra de insumos'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        // Utiliza la variable compraInsumosData que contiene los datos de la API
        future: compraInsumosData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras se obtienen los datos
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Muestra un mensaje de error si no se pueden obtener los datos
            return Center(child: Text('Error al cargar los datos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Muestra un mensaje si no hay datos disponibles
            return Center(child: Text('No se encontraron compras de insumos registradas'));
          } else {
            // Muestra la lista de supplyes obtenida de la API
            final compraInsumosData = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  compraInsumosData.length,
                  (index) => supplyCard(
                    compraInsumosData: compraInsumosData[index],
                    onTap: () {
                      _showsupplyDetails(context, index);
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

  void _showsupplyDetails(BuildContext context, int index) async {
    final data =
        await compraInsumosData; // Esperar a que compraInsumosData se resuelva
    showModalBottomSheet(
      context: context,
      builder: (context) => CompraInsumosDetailPage(
        compraInsumosData: data[index],
      ),
    );
  }
}

class supplyCard extends StatelessWidget {
  final Map<String, dynamic> compraInsumosData;
  final VoidCallback onTap;

  supplyCard({
    required this.compraInsumosData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool statedAt = compraInsumosData['statedAt'];

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
                Icons.shopping_cart_rounded,
                size: 56,
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Descripción: ${compraInsumosData['description']}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text('Fecha entrada: ${compraInsumosData['entryDate']}'),
                Text('Proveedor: ${compraInsumosData['provider']['nameCompany'] ?? 'Proveedor no disponible'}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
