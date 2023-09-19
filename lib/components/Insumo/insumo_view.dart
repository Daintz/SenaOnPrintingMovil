import 'package:flutter/material.dart';
import 'insumo_data.dart';
import 'insumo_details_page.dart';


class supplysView extends StatefulWidget {
  @override
  _supplysViewState createState() => _supplysViewState();
}

class _supplysViewState extends State<supplysView> {
  late Future<List<Map<String, dynamic>>> supplyData;

  @override
  void initState() {
    super.initState();
    // Inicializa la carga de datos cuando se crea la vista
    supplyData = fetchsupplyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insumos'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        // Utiliza la variable supplyData que contiene los datos de la API
        future: supplyData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras se obtienen los datos
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Muestra un mensaje de error si no se pueden obtener los datos
            return Center(child: Text('Error al cargar los datos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Muestra un mensaje si no hay datos disponibles
            return Center(child: Text('No se encontraron supplyes'));
          } else {
            // Muestra la lista de supplyes obtenida de la API
            final supplyData = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  supplyData.length,
                  (index) => supplyCard(
                    supplyData: supplyData[index],
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
  final data = await supplyData; // Esperar a que supplyData se resuelva
  showModalBottomSheet(
    context: context,
    builder: (context) => InsumosDetailPage(
      insumoData: data[index],  // Cambia supplyData a insumoData
      ),
  );
}
}
class supplyCard extends StatelessWidget {
  final Map<String, dynamic> supplyData;
  final VoidCallback onTap;

  supplyCard({
    required this.supplyData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool statedAt = supplyData['statedAt'];

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
                Text(supplyData['name'],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text('Tipo de insumo: ${supplyData['supplyType']}'),
                Text('Tipo de peligrosidad: ${supplyData['sortingWord']}'),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
