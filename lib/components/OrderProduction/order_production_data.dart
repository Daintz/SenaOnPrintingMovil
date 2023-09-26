import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../api_config.dart';

// Función para obtener datos de la API
Future<List<Map<String, dynamic>>> fetchOrderProductionData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? authToken = prefs.getString('authToken');
  final url = Uri.parse('${ApiConfig.baseUrl}/api/orderProduction');

  final response = await http.get(url,headers: {
      'Authorization': 'Bearer  $authToken', // Agregar el token al encabezado de autorización
    },);

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);

    // Mapear los datos de la respuesta API a la estructura que necesitas
    List<Map<String, dynamic>> supplyData = [];

    for (var supply in jsonData) {
      supplyData.add({
        'userName': supply['userName'],
        'orderDate': formatDateFromIsoString(supply['orderDate']),
        'deliverDate': formatDateFromIsoString(supply['deliverDate']),
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
