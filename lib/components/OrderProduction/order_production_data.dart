import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api_config.dart';

// Función para obtener datos de la API
Future<List<Map<String, dynamic>>> fetchOrderProductionData() async {
  final url = Uri.parse('${ApiConfig.baseUrl}/api/orderProduction');

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);

    // Mapear los datos de la respuesta API a la estructura que necesitas
    List<Map<String, dynamic>> supplyData = [];

    for (var supply in jsonData) {
      supplyData.add({
        'userName': supply['userName'],
        'orderDate': supply['orderDate'],
        'deliverDate': supply['deliverDate'],
        'statedAt': supply['statedAt'],
        'observations': supply['observations'],
        'product': supply['product'],
        'supplyType': supply['supplyType'],
        'machineName': supply['machineName'],
        'materialReception': supply['materialReception'],
        'program': supply['program'],
        'programVersion': supply['programVersion'],
        'lineature': supply['lineature'],
        'colorProfile': supply['colorProfile'],
        'typePoint': supply['typePoint'],
        'impositionPlanchName': supply['impositionPlanchName'],
        'name': supply['name'],
        'typeService': supply['typeService'],
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
