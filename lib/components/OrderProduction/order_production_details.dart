import 'package:flutter/material.dart';

class OrderProductionDetailsPage extends StatelessWidget {
  final Map<String, dynamic> orderProductionData;

  OrderProductionDetailsPage({
    required this.orderProductionData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle Orden de Producción'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('producto', orderProductionData['product']?? 'Producto no disponible',),
            _buildDetailRow('Fecha de orden', orderProductionData['orderDate']?? 'Fecha no disponible',),
            _buildDetailRow('Fecha entrega', orderProductionData['deliverDate']?? 'Fecha no disponible',),
            _buildDetailRow('Encargado', orderProductionData['userId']?? 'Encargado no disponible',),
            _buildDetailRow('Maquina', orderProductionData['machineId']?? 'Maquina no disponible',),
            _buildDetailRow('Observaciones', orderProductionData['observations']),
             SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildDetailRowWithImage('Imagen', orderProductionData['image']),
                    SizedBox(width: 16),
                    _buildDetailRowWithImage('Esquema', orderProductionData['scheme']),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label + ':',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}


  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label + ':',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildDetailRowWithImage(String label, String imageUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label + ':',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 8),
        Container(
          width: 175,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

