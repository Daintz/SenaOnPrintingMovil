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
        backgroundColor:
            Color.fromARGB(255, 0, 49, 77), // Color RGB personalizado
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDetailRow('Cliente', client),
                  _buildDetailRow('Producto', product),
                ],
              ),
              _buildDetailRow('Fecha entrega', deliveryDate),
              _buildDetailRow('Proceso', process),
              _buildDetailRow('Tipo de servicio', typeService),
              _buildDetailRow('Estado', statedAt),
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
}

Widget _buildDetailRowWithImage(String label, String imageUrl) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label + ': ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      Image.network(
        imageUrl, // URL de la imagen
        width: 200, // Ancho de la imagen
        height: 200, // Alto de la imagen
        fit: BoxFit.cover, // Ajuste de la imagen dentro del contenedor
      ),
    ],
  );
}
