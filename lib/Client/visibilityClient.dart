import 'package:flutter/material.dart';

class ClientDetailsPage extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final String center;
  final String area;
  final String regional;

  ClientDetailsPage({
    required this.name,
    required this.phone,
    required this.email,
    required this.center,
    required this.area,
    required this.regional,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Cliente'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77), // Color RGB personalizado
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Nombre', name),
            _buildDetailRow('Teléfono', phone),
            _buildDetailRow('Correo', email),
            _buildDetailRow('Centro', center),
            _buildDetailRow('Área', area),
            _buildDetailRow('Regional', regional),
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
