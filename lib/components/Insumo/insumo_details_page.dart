import 'package:flutter/material.dart';

class InsumosDetailPage extends StatelessWidget {
  final Map<String, dynamic> insumoData;

  InsumosDetailPage({
    required this.insumoData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Insumo'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Nombre', '${insumoData['name']}'),
            _buildDetailRow('Tipo de insumo', '${insumoData['supplyType']}'),
            _buildDetailRow('Tipo Peligrosidad', '${insumoData['dangerIndicators']}'),
            _buildDetailRow('Categorias', '${insumoData['supplyCategoriesId']}'),
            _buildDetailRow('Costo Promedio', '${insumoData['averageCost']}'),
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
