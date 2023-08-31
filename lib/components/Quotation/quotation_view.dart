import 'package:flutter/material.dart';
import 'package:senaonprintingmovil/components/Quotation/quotation_details_page.dart';
import 'quotation_data.dart'; // Importa los datos de las cotizaciones

class QuotationClientView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotizaciones'),
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
            quotationData.length,
            (index) => QuotationCard(
              quotationData: quotationData[index],
              onTap: () {
                _showQuotationDetails(context, index);
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showQuotationDetails(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) => QuotationDetailsPage(
        quotationData: quotationData[index],
      ),
    );
  }
}

class QuotationCard extends StatelessWidget {
  final Map<String, dynamic> quotationData;
  final VoidCallback onTap;

  QuotationCard({
    required this.quotationData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isActive = quotationData['isActive'];
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
              color: isActive ? Colors.green : Colors.red,
            ),
            SizedBox(width: 12),
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Icon(
                Icons.money_rounded, // Cambia el icono para las cotizaciones
                size: 56,
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Código: ${quotationData['code']}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Text('Fecha: ${quotationData['date']}'),
                Text('Cliente: ${quotationData['client']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
