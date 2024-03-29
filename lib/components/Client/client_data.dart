import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../api_config.dart';

// Función para obtener datos de la API
Future<List<Map<String, dynamic>>> fetchClientData() async {
  final url = Uri.parse('${ApiConfig.baseUrl}/api/Client');
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? authToken = prefs.getString('authToken');

  final response = await http.get(
    url,
    headers: {
      'Authorization': 'Bearer  $authToken', // Agregar el token al encabezado de autorización
    },
  );
  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);

    // Mapear los datos de la respuesta API a la estructura que necesitas
    List<Map<String, dynamic>> clientData = [];

    for (var client in jsonData) {
      clientData.add({
        'name': client['name'],
        'statedAt': client['statedAt'],
        'phone': client['phone'],
        'email': client['email'],
        'center': client['center'],
        'area': client['area'],
        'regional': client['regional'],
      });
    }

    return clientData;
  } else {
    // Manejar errores aquí si es necesario
    throw Exception('Error al cargar datos de la API');
  }
}
