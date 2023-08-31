import 'package:flutter/material.dart';

class QuotationDetailsPage extends StatelessWidget {
  final Map<String, dynamic> quotationData;

  QuotationDetailsPage({
    required this.quotationData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Cotización'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Código', quotationData['code']),
              _buildDetailRow('Fecha orden', quotationData['date']),
              _buildDetailRow('Cliente', quotationData['client']),
              _buildProductList(quotationData['products']), // Mostrar lista de productos
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

  Widget _buildProductList(List<Map<String, dynamic>> products) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Productos:',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      SizedBox(height: 8), // Espacio entre el título y la lista de productos
      Column(
        children: products.map((product) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    product['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  trailing: Text(
                    'Valor: ${product['valor']}',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Cantidad: ${product['cantidad']}',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 6),
                Text(
                  'Tipo de Servicio: ${product['TipeS']}',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    ],
  );
}
}
