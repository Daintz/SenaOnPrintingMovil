import 'package:flutter/material.dart';
import 'order_production_data.dart';
import 'order_production_details.dart';

class orderProductionsView extends StatefulWidget {
  @override
  _orderProductionsViewState createState() => _orderProductionsViewState();
}

class _orderProductionsViewState extends State<orderProductionsView> {
  late Future<List<Map<String, dynamic>>> orderProductionData;

  @override
  void initState() {
    super.initState();
    // Inicializa la carga de datos cuando se crea la vista
    orderProductionData = fetchOrderProductionData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ordenes de Producción'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        // Utiliza la variable orderProductionData que contiene los datos de la API
        future: orderProductionData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras se obtienen los datos
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Muestra un mensaje de error si no se pueden obtener los datos
            return Center(child: Text('Error al cargar los datos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Muestra un mensaje si no hay datos disponibles
            return Center(child: Text('No se encontraron ordenes de producción'));
          } else {
            // Muestra la lista de orderProductiones obtenida de la API
            final orderProductionData = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  orderProductionData.length,
                  (index) => orderProductionCard(
                    orderProductionData: orderProductionData[index],
                    onTap: () {
                      _showorderProductionDetails(context, index);
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

  void _showorderProductionDetails(BuildContext context, int index) async {
  final data = await orderProductionData; // Esperar a que orderProductionData se resuelva
  showModalBottomSheet(
    context: context,
    builder: (context) => OrderProductionDetailsPage(
      orderProductionData: data[index],
    ),
  );
}
}
class orderProductionCard extends StatelessWidget {
  final Map<String, dynamic> orderProductionData;
  final VoidCallback onTap;

  orderProductionCard({
    required this.orderProductionData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool statedAt = orderProductionData['statedAt'];

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
                Text(orderProductionData['product']?? 'Producto no disponible',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text('Fecha de orden: ${orderProductionData['orderDate']}'),
              Text('Fecha entrega: ${orderProductionData['deliverDate']}'),
              Text('Maquina: ${orderProductionData['machineId']}'),
              Text('Observaciones: ${orderProductionData['observations']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
