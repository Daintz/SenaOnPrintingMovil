import 'package:flutter/material.dart';

class OrderProductionDetailsPage extends StatelessWidget {
  final String client;
  final String product;
  final String deliveryDate;
  final String process;
  final String typeService;
  final String statedAt;
  final String scheme;
  final String image;

  OrderProductionDetailsPage({
    required this.client,
    required this.product,
    required this.deliveryDate,
    required this.process,
    required this.typeService,
    required this.statedAt,
    required this.scheme,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del OP'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Cliente', client),
              _buildDetailRow('Producto', product),
              _buildDetailRow('Fecha entrega', deliveryDate),
              _buildDetailRow('Proceso', process),
              _buildDetailRow('Tipo de servicio', typeService),
              _buildDetailRow('Estado', statedAt),
              SizedBox(height: 16),
              _buildDetailRowWithImage('Imagen', image),
              SizedBox(height: 16),
              _buildDetailRowWithImage('Esquema', scheme),
            ],
          ),
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
          width: 200,
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
}