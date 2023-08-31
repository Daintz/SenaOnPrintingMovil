import 'package:flutter/material.dart';
import 'VisibilityOrderProduction.dart';

void main() {
  runApp(MaterialApp(home: OrderProduction()));
}

class OrderProduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ordenes de producción'),
        backgroundColor:
            Color.fromARGB(255, 0, 49, 77), // Color RGB personalizado
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icono de flecha hacia atrás
          onPressed: () {
            Navigator.pop(context); // Regresar a la pantalla anterior
          },
        ),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(label: Text('Cliente')),
            DataColumn(label: Text('Producto')),
            DataColumn(
                label: Text('Acciones')), // Columna para los iconos de acción
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Katherin Cadavid')),
              DataCell(Text('Mug')),
              DataCell(_buildActionsCell(context)), // Icono de ojo
            ]),
            DataRow(cells: [
              DataCell(Text('Luna Torres')),
              DataCell(Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Libreta oferta'),
                  Text('Libreta tapa blanda'),
                ],
              )),
              DataCell(_buildActionsCell(context)), // Icono de ojo
            ]),

            // ... Agregar más filas según sea necesario
          ],
        ),
      ),
    );
  }

  Widget _buildActionsCell(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.visibility), // Icono del ojo
      onPressed: () {
        // Mostrar detalles del cliente
        _showClientDetails(context);
      },
    );
  }

  void _showClientDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderProductionDetailsPage(
          client: ' Katherin Cadavid',
          product: ' Mug',
          deliveryDate: ' 1-Sep-2023',
          process: ' Impresión',
          typeService: ' Sublimación',
          statedAt: ' Activo',
          scheme:
              'https://images.unsplash.com/photo-1688870550853-f5956b4c010d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
          image:
              'https://images.unsplash.com/photo-1677746792119-d8f8ee8e77f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1960&q=80',
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
