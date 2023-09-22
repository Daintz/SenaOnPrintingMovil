import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api_config.dart';

// Función para obtener datos de la API
Future<List<Map<String, dynamic>>> fetchsupplyDetailsData() async {
  final url = Uri.parse('${ApiConfig.baseUrl}/api/buy_supplies');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);

    // Mapear los datos de la respuesta API a la estructura que necesitas
    List<Map<String, dynamic>> supplyData = [];

    for (var supply in jsonData) {
      supplyData.add({
        'description': supply['description'],
        'entryDate': supply['entryDate'],
        'provider': supply['provider'],
        'buySuppliesDetails': supply['buySuppliesDetails'],
        'statedAt': supply['statedAt'],

      });
    }

    return supplyData;
  } else {
    // Manejar errores aquí si es necesario
    throw Exception('Error al cargar datos de la API');
  }
}
