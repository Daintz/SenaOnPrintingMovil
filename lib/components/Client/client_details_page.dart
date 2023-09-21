import 'package:flutter/material.dart';

class ClientDetailsPage extends StatelessWidget {
  final Map<String, dynamic> clientData;

  ClientDetailsPage({
    required this.clientData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Cliente'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Nombre', clientData['name']),
            _buildDetailRow('Teléfono', clientData['phone']),
            _buildDetailRow('Correo electrónico', clientData['email']),
            _buildDetailRow('Centro', clientData['center']),
            _buildDetailRow('Área', clientData['area']),
            _buildDetailRow('Regional', clientData['regional']),
            
          ],
        ),
      ),
    );
  }

 Widget _buildDetailRow(String label, String value) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label + ':',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(value),
          ],
        ),
        Divider(), // Add a divider between rows
      ],
    );
  }
}
