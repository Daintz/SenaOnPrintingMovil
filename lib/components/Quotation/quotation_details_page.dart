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
              _buildDetailRow('Codigo', '${quotationData['code']}'),
              _buildDetailRow('Cotizador', quotationData['user']['names'] ?? 'Cotizador no disponible'),
              _buildDetailRow('Cliente', '${quotationData['client']['name']}'),
              _buildDetailRow('Fecha Orden', '${quotationData['orderDate']}'),
              _buildDetailRow('Fecha Entrega', '${quotationData['deliverDate']}'),
              _buildDetailRow('Valor Total', '${quotationData['fullValue']}'),
              _buildSupplyCards(quotationData['quotationClientDetails']),
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

  Widget _buildSupplyCards(List<dynamic> quotationDetails) {
    return Column(
      children: quotationDetails.map((quotationDetail) {
        return _buildSupplyCard(quotationDetail);
      }).toList(),
    );
  }

  Widget _buildSupplyCard(dynamic quotationDetail) {
    return Card(
      child: ExpansionTile(
        title: Text(quotationDetail['product']['name']),
        children: [
          _buildDetailRow1('Cantidad', quotationDetail['quantity'].toString()),
          _buildDetailRow1('Costo', quotationDetail['cost'].toString()),

        ],
      ),
    );
  }

