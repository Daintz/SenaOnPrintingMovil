import 'package:flutter/material.dart';
import 'insumo_data.dart';
import 'insumo_details_page.dart';

class InsumoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insumos'),
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
            insumoslista.length,
            (index) => InsumoCard(
              insumoData: insumoslista[index],
              onTap: () {
                _showInsumoDetails(context, index);
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showInsumoDetails(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) => InsumosDetailPage(
        insumoData: insumoslista[index],
      ),
    );
  }
}

class InsumoCard extends StatelessWidget {
  final Map<String, dynamic> insumoData;
  final VoidCallback onTap;

  InsumoCard({
    required this.insumoData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool statedAt = insumoData['estado'];

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
              color: statedAt ? Colors.green : Colors.red,
            ),
            SizedBox(width: 12),
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Icon(
                Icons.science_rounded,
                size: 56,
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(insumoData['Nombre'],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text('Tipo de insumo: ${insumoData['TipoInsumo']}'),
                Text('Tipo Peligrosidad: ${insumoData['TipoPeligrosidad']}'),
                Text('Cantidad: ${insumoData['Cantidad']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
