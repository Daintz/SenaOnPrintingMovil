import 'package:flutter/material.dart';
import 'package:senaonprintingmovil/components/Quotation/quotation_data.dart';
import 'package:senaonprintingmovil/components/Quotation/quotation_details_page.dart';


class QuotationClientView extends StatefulWidget {
  @override
  _QuotationClientViewState createState() => _QuotationClientViewState();
}

class _QuotationClientViewState extends State<QuotationClientView> {
  late Future<List<Map<String, dynamic>>> quotationClientData;

  @override
  void initState() {
    super.initState();
    // Inicializa la carga de datos cuando se crea la vista
    quotationClientData = fetchQuotationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cotizaciones de Clientes'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        // Utiliza la variable quotationClientData que contiene los datos de la API
        future: quotationClientData,
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
            // Muestra la lista de supplyes obtenida de la API
            final quotationClientData = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  quotationClientData.length,
                  (index) => supplyCard(
                    quotationClientData: quotationClientData[index],
                    onTap: () {
                      _showsupplyDetails(context, index);
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

  void _showsupplyDetails(BuildContext context, int index) async {
    final data =
        await quotationClientData; // Esperar a que quotationClientData se resuelva
    showModalBottomSheet(
      context: context,
      builder: (context) => QuotationDetailsPage(
        quotationData: data[index],
      ),
    );
  }
}

class supplyCard extends StatelessWidget {
  final Map<String, dynamic> quotationClientData;
  final VoidCallback onTap;

  supplyCard({
    required this.quotationClientData,
    required this.onTap,
  });
Map<String, dynamic> getStatusTextAndColor(int value) {
    String statusText;
    Color statusColor;

    switch (value) {
      case 1:
        statusText = 'En Proceso';
        statusColor = Colors.green;
        break;
      case 2:
        statusText = 'Aprobado';
        statusColor = Colors.blue;
        break;
      case 3:
        statusText = 'No Aprobado';
        statusColor = Colors.red;
        break;
      default:
        statusText = 'Terminado';
        statusColor = Colors.blue;
        break;
    }

    return {'text': statusText, 'color': statusColor};
  }
  @override
  Widget build(BuildContext context) {
    final int orderStatus = quotationClientData['quotationStatus'] ?? 0;
    final statusInfo = getStatusTextAndColor(orderStatus);

  bool statedAt = quotationClientData['statedAt'];

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
                Icons.shopping_cart_rounded,
                size: 56,
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Código: ${quotationClientData['code']}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text('${statusInfo['text']}',style: TextStyle(color: statusInfo['color'], fontWeight: FontWeight.bold)),
                Text('Cotizador: ${quotationClientData['user']['names']}'),
                Text('Cliente: ${quotationClientData['client']['name'] ?? 'Cliente no disponible'}'),
                Text('Fecha Orden: ${quotationClientData['orderDate']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
