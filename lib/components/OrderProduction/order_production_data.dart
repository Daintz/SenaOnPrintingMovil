import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api_config.dart';

// Función para obtener datos de la API
Future<List<Map<String, dynamic>>> fetchOrderProductionData() async {
  final url = Uri.parse('${ApiConfig.baseUrl}/api/OrderProduction');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);

    // Mapear los datos de la respuesta API a la estructura que necesitas
    List<Map<String, dynamic>> supplyData = [];

    for (var supply in jsonData) {
      supplyData.add({
        'userId': supply['userId'],
        'orderDate': supply['orderDate'],
        'deliverDate': supply['deliverDate'],
        'statedAt': supply['statedAt'],
        'observations': supply['observations'],
        'product': supply['product'],
        'supplyType': supply['supplyType'],
        'machineId': supply['machineId'],
        'image': supply['image'],
        'scheme': supply['scheme'],
        'orderStatus': supply['orderStatus'],
      });
    }

    return supplyData;
  } else {
    // Manejar errores aquí si es necesario
    throw Exception('Error al cargar datos de la API');
  }
}
