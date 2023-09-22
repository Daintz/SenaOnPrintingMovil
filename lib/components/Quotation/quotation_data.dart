import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api_config.dart';

// Función para obtener datos de la API
Future<List<Map<String, dynamic>>> fetchQuotationData() async {
  final url = Uri.parse('${ApiConfig.baseUrl}/api/QuotationClient');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);

    // Mapear los datos de la respuesta API a la estructura que necesitas
    List<Map<String, dynamic>> quotationClientData = [];

    for (var quotationClient in jsonData) {
      quotationClientData.add({
        'code': quotationClient['code'],
        'orderDate': formatDateFromIsoString(quotationClient['orderDate']),
        'deliverDate': formatDateFromIsoString(quotationClient['deliverDate']),
        'quotationStatus': quotationClient['quotationStatus'],
        'fullValue': quotationClient['fullValue'],
        'quantity': quotationClient['quantity'],
        'user': quotationClient['user'],
        'client': quotationClient['client'],
        'quotationClientDetails': quotationClient['quotationClientDetails'],
        'statedAt': quotationClient['statedAt'],
      });
    }

    return quotationClientData;
  } else {
    // Manejar errores aquí si es necesario
    throw Exception('Error al cargar datos de la API');
  }
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
