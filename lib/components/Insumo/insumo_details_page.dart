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
            _buildDetailRow('Indicadores de peligro', '${insumoData['dangerIndicators']}'),
            _buildDetailRow('Consejos', '${insumoData['advices']}'),
            _buildDetailRow('Instrucciones', '${insumoData['useInstructions']}'),
            _buildDetailRow('Tipo de insumo', '${insumoData['supplyType']}'),
            _buildDetailRow('Tipo de peligrosidad', '${insumoData['sortingWord']}'),
            _buildDetailRow('Costo Promedio', '${insumoData['averageCost']}'),
            _buildDetailRow('Unidad de medida:','${(insumoData['unitMeasuresXSupply'].map((uxs) => uxs['unitMeasure']['name'])).join(', ') }'),
            _buildDetailRow('Pictograma:','${(insumoData['supplyXSupplyPictogram'].map((uxs) => uxs['supplyPictogram']['name'])).join(', ') }'),
            _buildDetailRow('Categoria Insumo:','${(insumoData['supplyCategoriesXSupply'].map((uxs) => uxs['supplyCategoryNavigation']['name'])).join(', ') }'),
          ],
        ),
      ),
    );
  }

Widget _buildDetailRow(String label, String value) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
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
      ),
    );
  }
}
