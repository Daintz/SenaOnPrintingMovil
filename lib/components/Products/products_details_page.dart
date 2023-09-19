import 'package:flutter/material.dart';

class ProductsDetailsPage extends StatelessWidget {
  final Map<String, dynamic> productsData;

  ProductsDetailsPage({
    required this.productsData,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles productos'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Nombre', productsData['name']),
              _buildDetailRow('Tipo producto', productsData['typeProduct']),
              _buildDetailRow('Código', '${productsData['cost']}'),
              _buildDetailRow('Tamaño', productsData['size'] ?? 'No disponible'),
              _buildDetailRow('Tintas Portada', '${productsData['frontPageInks']}'),
              _buildDetailRow('Tinta Especial', productsData['frontPagePantone'] ?? 'No disponible'),
              _buildDetailRow('Codigo tinta', '${productsData['frontPageCode']}'),
              _buildDetailRow('Numero paginas','${productsData['numberPages']}'),
              _buildDetailRow('Sustrato Portada', '${productsData['substratumFrontPage']}'),
              _buildDetailRow('Sustrato Contraportada', '${productsData['substratumBackCover'] }'),
              _buildDetailRow('Sustrato Interior', '${productsData['substratumInside']}'),
              _buildDetailRow('Sustratos', '${productsData['substratum'] }'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label + ':',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

}
