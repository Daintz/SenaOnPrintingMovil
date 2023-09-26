import 'package:flutter/material.dart';

class CompraInsumosDetailPage extends StatelessWidget {
  final Map<String, dynamic> compraInsumosData;

  CompraInsumosDetailPage({
    required this.compraInsumosData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Compra'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow(
                  'Descripción', '${compraInsumosData['description']}'),
              _buildDetailRow('Fecha entrada',
                  compraInsumosData['entryDate'] ?? 'Fecha no disponible'),
              _buildDetailRow('Proveedor',
                  '${compraInsumosData['provider']['nameCompany']}'),
              _buildSupplyCards(compraInsumosData['buySuppliesDetails']),
            ],
          ),
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

Widget _buildDetailRow1(String label, String value) {
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

Widget _buildSupplyCards(List<dynamic> supplyDetails) {
  return Column(
    children: supplyDetails.map((supplyDetail) {
      return _buildSupplyCard(supplyDetail);
    }).toList(),
  );
}

Widget _buildSupplyCard(dynamic supplyDetail) {
  return Card(
    child: ExpansionTile(
      title: Text(supplyDetail['supply']['name']),
      children: [
        _buildDetailRow1('Cantidad', supplyDetail['supplyQuantity'].toString()),
        _buildDetailRow1('Costo', supplyDetail['supplyCost'].toString()),
        _buildDetailRow1('Bodega', supplyDetail['warehouse']['ubication']),
        _buildDetailRow1('Fecha Caducidad', formatDateFromIsoString(supplyDetail['expirationDate'])),
        _buildDetailRow1('Unidad Medida', supplyDetail['unitMeasures']['name']),
      ],
    ),
  );

}
String formatDateFromIsoString(String isoDateString) {
  if (isoDateString != null && isoDateString.isNotEmpty) {
    final parts =
        isoDateString.split('T'); // Separar la fecha de la hora si es necesario
    final datePart = parts[0]; // Obtener la parte de la fecha

    final dateParts = datePart.split('-'); // Separar el año, mes y día
    final year = dateParts[0];
    final month = dateParts[1];
    final day = dateParts[2];

    // Mapear los nombres de los meses en español
    final List<String> spanishMonths = [
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic'
    ];

    final int monthIndex =
        int.tryParse(month) ?? 1; // Convertir el mes a número

    final formattedDate = '$day de ${spanishMonths[monthIndex - 1]} $year';

    return formattedDate;
  } else {
    return 'Fecha no disponible';
  }
}
