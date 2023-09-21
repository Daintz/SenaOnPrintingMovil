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
        'orderDate': quotationClient['orderDate'],
        'deliverDate': quotationClient['deliverDate'],
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
