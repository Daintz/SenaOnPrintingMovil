import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api_config.dart';

// Función para obtener datos de la API
Future<List<Map<String, dynamic>>> fetchsupplyDetailsData() async {
  final url = Uri.parse('${ApiConfig.baseUrl}/api/SupplyDetails');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);

    // Mapear los datos de la respuesta API a la estructura que necesitas
    List<Map<String, dynamic>> supplyData = [];

    for (var supply in jsonData) {
      supplyData.add({
        'supplyId': supply['supplyId'],
        'providerId': supply['providerId'],
        'description': supply['description'],
        'supplyCost': supply['supplyCost'],
        'entryDate': supply['entryDate'],
        'expirationDate': supply['expirationDate'],
        'warehouseId': supply['warehouseId'],
        'statedAt': supply['statedAt'],

      });
    }

    return supplyData;
  } else {
    // Manejar errores aquí si es necesario
    throw Exception('Error al cargar datos de la API');
  }
}
