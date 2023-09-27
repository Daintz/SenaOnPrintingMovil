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
            if (productsData['typeProduct'] == 'Libreta')
              Column(
                children: [
                  _buildDetailRow('Nombre', productsData['name']),
                  _buildDetailRow('Tipo producto', productsData['typeProduct']),
                  _buildDetailRow('Costo', '${productsData['cost']}'),
                  _buildDetailRow('Tamaño', productsData['size']),
                  _buildDetailRow('portada', productsData['frontpage'] == true ? 'Si' : 'No'),
                  _buildDetailRow('Tintas Portada', productsData['frontPageInks'] == true ? 'Si' : 'No'),
                  _buildDetailRow('Portada pantone', productsData['FrontPagePantone'] != null ? productsData['FrontPagePantone'] : 'No'),
                  _buildDetailRow('Portada codigo', productsData['frontPageCode'] != null ? productsData['frontPageCode'] : 'No'),
                  _buildDetailRow('Sutratos Portada', productsData['susbtrateFrontPage'] != null ? productsData['susbtrateFrontPage'] : 'No'),
                  _buildDetailRow('Contraportada', productsData['backCover'] == true ? 'Si' : 'No'),
                  _buildDetailRow('Tintas contraportada', productsData['backCoverInks'] == true ? 'Si' : 'No'),
                  _buildDetailRow('Contraportada pantone', productsData['backCoverPantone'] != null ? productsData['backCoverPantone'] : 'No'),
                  _buildDetailRow('Contraportada codigo', productsData['backCoverCode'] != null ? productsData['backCoverCode'] : 'No'),
                  _buildDetailRow('Sustratos contraportada', productsData['susbtrateSheets'] != null ? productsData['susbtrateSheets'] : 'No'),
                  _buildDetailRow('Interior hojas',  productsData['inside'] == true ? 'Si' : 'No'),
                  _buildDetailRow('Tintas interior hojas',  productsData['insideInks'] == true ? 'Si' : 'No'),
                  _buildDetailRow('Interior hojas pantone', productsData['insidePantone'] != null ? productsData['insidePantone'] : 'No'),
                  _buildDetailRow('Interior hojas codigo', productsData['insideCode'] != null ? productsData['insideCode'] : 'No'),
                  _buildDetailRow('Numero paginas','${productsData['numberPages']}'),
                  _buildDetailRow('Encuadernacion', productsData['cover']),
                  _buildDetailRow('Acabados', productsData['bindings']),
                  _buildDetailRow('Sustratos', '${productsData['substratum'] }'),
                  _buildDetailRow('Estado', productsData['observations'] == true ? 'Activo' : 'Inactivo'),
                ],
              ),
            if (productsData['typeProduct'] == 'Gran formato')
              Column(
                children: [
                  _buildDetailRow('Nombre', productsData['name']),
                  _buildDetailRow('Tipo producto', productsData['typeProduct']),
                  _buildDetailRow('Costo', '${productsData['cost']}'),
                  _buildDetailRow('Dimension', productsData['dimension']),
                  _buildDetailRow('Acabados', productsData['bindings']),
                  _buildDetailRow('Sustratos', productsData['susbtrateLargeFormat'] != null ? productsData['susbtrateLargeFormat'] : 'No'),
                  _buildDetailRow('Estado', productsData['observations'] == true ? 'Activo' : 'Inactivo'),
                ],
              ),
            if (productsData['typeProduct'] == 'Souvenir')
              Column(
                children: [
                  _buildDetailRow('Nombre', productsData['name']),
                  _buildDetailRow('Tipo producto', productsData['typeProduct']),
                  _buildDetailRow('Costo', '${productsData['cost']}'),
                  _buildDetailRow('Dimension', productsData['dimension']),
                  _buildDetailRow('Acabados', productsData['bindings']),
                  _buildDetailRow('Estado', productsData['observations'] == true ? 'Activo' : 'Inactivo'),
                ],
              ),
            if (productsData['typeProduct'] == 'Papelería')
              Column(
                children: [
                  _buildDetailRow('Nombre', productsData['name']),
                  _buildDetailRow('Tipo producto', productsData['typeProduct']),
                  _buildDetailRow('Costo', '${productsData['cost']}'),
                  _buildDetailRow('Dimension', productsData['dimension']),
                  _buildDetailRow('Acabados', productsData['bindings']),
                  _buildDetailRow('Sustratos', productsData['susbtrateLargeFormat'] != null ? productsData['susbtrateLargeFormat'] : 'No'),
                  _buildDetailRow('Estado', productsData['observations'] == true ? 'Activo' : 'Inactivo'),
                ],
              ),
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
