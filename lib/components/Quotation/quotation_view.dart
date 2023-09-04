import 'package:flutter/material.dart';
import 'package:senaonprintingmovil/components/Quotation/quotation_details_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api_config.dart';

class QuotationClientView extends StatefulWidget {
  @override
  _QuotationClientViewState createState() => _QuotationClientViewState();
}

class _QuotationClientViewState extends State<QuotationClientView> {
  late Future<List<Map<String, dynamic>>> quotationData;

  @override
  void initState() {
    super.initState();
    // Inicializa la carga de datos cuando se crea la vista
    quotationData = fetchQuotationData();
  }

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
      body: FutureBuilder<List<Map<String, dynamic>>>(
        // Utiliza la variable quotationData que contiene los datos de la API
        future: quotationData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras se obtienen los datos
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Muestra un mensaje de error si no se pueden obtener los datos
            return Center(child: Text('Error al cargar los datos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Muestra un mensaje si no hay datos disponibles
            return Center(child: Text('No se encontraron cotizaciones'));
          } else {
            // Muestra la lista de cotizaciones obtenida de la API
            final quotationData = snapshot.data!;
            return SingleChildScrollView(
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
            );
          }
        },
      ),
    );
  }

  void _showQuotationDetails(BuildContext context, int index) {
  quotationData.then((data) {
    showModalBottomSheet(
      context: context,
      builder: (context) => QuotationDetailsPage(
        quotationData: data[index],
      ),
    );
  });
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
    bool isActive = quotationData['statedAt']; // Asegúrate de tener un campo correcto para el estado de la cotización

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
                Text('Fecha: ${quotationData['orderDate']}'), // Ajusta el campo de fecha según tus datos
                Text('Cliente: ${quotationData['client']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<List<Map<String, dynamic>>> fetchQuotationData() async {
  final url = Uri.parse('${ApiConfig.baseUrl}/api/QuotationClient');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);

    List<Map<String, dynamic>> quotationClientData = [];

    for (var quotationClient in jsonData) {
      quotationClientData.add({
        'user': quotationClient['userId'],
        'client': quotationClient['clientId'],
        'code': quotationClient['code'],
        'orderDate': quotationClient['orderDate'],
        'statedAt': quotationClient['statedAt'],
        'deliverDate': quotationClient['deliverDate'],
        'quotationStatus': quotationClient['quotationStatus'],
        'fullValue': quotationClient['fullValue'],
        'quotationClientDetailCreateDto': [
          {
            "typeServiceId": quotationClient['typeServiceId'],
            "productId": quotationClient['productId'],
            "cost": quotationClient['cost'],
            "quantity": quotationClient['quantity'],
            "statedAt": quotationClient['statedAt']
          }
        ]
      });
    }

    return quotationClientData;
  } else {
    throw Exception('Error al cargar datos de la API');
  }
}
