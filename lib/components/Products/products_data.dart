import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../api_config.dart';

Future<List<Map<String, dynamic>>> fetchProductData() async {
  final url = Uri.parse('${ApiConfig.baseUrl}/api/product');
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? authToken = prefs.getString('authToken');
  final response = await http.get(url, headers: {
      'Authorization': 'Bearer  $authToken', // Agregar el token al encabezado de autorización
    },);

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    // Mapear los datos de la respuesta API a la estructura que necesitas
    List<Map<String, dynamic>> productData = [];

    for (var product in jsonData) {
      productData.add({
        'id': product['id'],
        'name': product['name'],
        'typeProduct': product['typeProduct'],
        'paperCutId': product['paperCutId'],
        'cost': product['cost'],
        'observations': product['observations'],
        'statedAt': product['statedAt'],
        'size': product['size'],
        'frontPage': product['frontPage'],
        'frontPageInks': product['frontPageInks'],
        'frontPageNumberInks': product['frontPageNumberInks'],
        'frontPagePantone': product['frontPagePantone'],
        'frontPageCode': product['frontPageCode'],
        'backCover': product['backCover'],
        'backCoverInks': product['backCoverInks'],
        'backCoverNumberInks': product['backCoverNumberInks'],
        'backCoverPantone': product['backCoverPantone'],
        'backCoverCode': product['backCoverCode'],
        'inside': product['inside'],
        'insideInks': product['insideInks'],
        'insideNumberInks': product['insideNumberInks'],
        'insidePantone': product['insidePantone'],
        'insideCode': product['insideCode'],
        'numberPages': product['numberPages'],
        'cover': product['cover'],
        'bindings': product['bindings'],
        'dimension': product['dimension'],
        'substratumFrontPage': product['substratumFrontPage'],
        'substratumInside': product['substratumInside'],
        'substratum': product['substratum'],
      });
    }

    return productData;
  } else {
    // Manejar errores aquí si es necesario
    throw Exception('Error al cargar datos de productos desde la API');
  }
}
