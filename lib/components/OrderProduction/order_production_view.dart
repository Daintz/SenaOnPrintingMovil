import 'package:flutter/material.dart';
import 'package:senaonprintingmovil/components/OrderProduction/order_production_data.dart';
import 'package:senaonprintingmovil/components/OrderProduction/order_production_details.dart';

class OrderProduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ordenes de producción'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            orderProductionData.length,
            (index) => OrderProductionCard(
              orderProductionData: orderProductionData[index],
              onTap: () {
                _showOrderProductionDetails(context, index);
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showOrderProductionDetails(BuildContext context, int index) {
  showModalBottomSheet(
    context: context,
    builder: (context) => OrderProductionDetailsPage(
      client: orderProductionData[index]['client'],
      product: orderProductionData[index]['product'],
      deliveryDate: orderProductionData[index]['deliveryDate'],
      process: orderProductionData[index]['process'],
      typeService: orderProductionData[index]['typeService'],
      statedAt: orderProductionData[index]['statedAt'] ? 'Activo' : 'Inactivo', // Convertir a cadena de texto
      scheme: orderProductionData[index]['scheme'],
      image: orderProductionData[index]['image'],
    ),
  );
}
}

class OrderProductionCard extends StatelessWidget {
  final Map<String, dynamic> orderProductionData;
  final VoidCallback onTap;

  OrderProductionCard({
  required this.orderProductionData,
  required this.onTap,
});

@override
Widget build(BuildContext context) {
  bool statedAt = orderProductionData['statedAt']; // Esto está bien si statedAt es un booleano
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
            color: statedAt ? Colors.green : Colors.red, // Aquí cambia la lógica según el valor booleano
          ),
          SizedBox(width: 12),
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Icon(
              Icons.production_quantity_limits,
              size: 36,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Cliente: ${orderProductionData['client']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              Text('Producto: ${orderProductionData['product']}'),
              Text('Fecha entrega: ${orderProductionData['deliveryDate']}'),
              Text('Proceso: ${orderProductionData['process']}'),
            ],
          ),
        ],
      ),
    ),
  );
}
}
