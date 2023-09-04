import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api_config.dart';

// Función para obtener datos de la API
Future<List<Map<String, dynamic>>> fetchsupplyData() async {
  final url = Uri.parse('${ApiConfig.baseUrl}/api/Supply');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);

    // Mapear los datos de la respuesta API a la estructura que necesitas
    List<Map<String, dynamic>> supplyData = [];

    for (var supply in jsonData) {
      supplyData.add({
        'name': supply['name'],
        'statedAt': supply['statedAt'],
        'dangerIndicators': supply['dangerIndicators'],
        'useInstructions': supply['useInstructions'],
        'supplyType': supply['supplyType'],
        'sortingWord': supply['sortingWord'],
        'averageCost': supply['averageCost'],
        'unitMeasuresId': supply['unitMeasuresId'],
        'supplyPictogramsId': supply['supplyPictogramsId'],
        'supplyCategoriesId': supply['supplyCategoriesId'],
      });
    }

    return supplyData;
  } else {
    // Manejar errores aquí si es necesario
    throw Exception('Error al cargar datos de la API');
  }
}
