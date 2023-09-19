import 'package:flutter/material.dart';

class compraInsumossDetailPage extends StatelessWidget {
  final Map<String, dynamic> compraInsumosData;

  compraInsumossDetailPage({
    required this.compraInsumosData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del compra insumos'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Bodega', '${compraInsumosData['warehouseId']}'),
            _buildDetailRow('Insumo', '${compraInsumosData['supplyId']}'),
            _buildDetailRow('Proveedor', '${compraInsumosData['providerId']}'),
            _buildDetailRow(
                'Descripción', '${compraInsumosData['description']}'),
            _buildDetailRow(
                'Costo de insumo', '${compraInsumosData['supplyCost']}'),
            _buildDetailRow(
                'Fecha de entrada', '${compraInsumosData['entryDate']}'),
            _buildDetailRow(
                'Fecha de caducidad', '${compraInsumosData['expirationDate']}'),
            _buildDetailRow('Estado', '${compraInsumosData['statedAt']}'),
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
