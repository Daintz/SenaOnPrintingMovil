import 'package:flutter/material.dart';
import 'package:senaonprintingmovil/Client/visibilityClient.dart';

void main() {
  runApp(MaterialApp(home: Clients()));
}

class Clients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77), // Color RGB personalizado
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
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Estado')),
            DataColumn(label: Text('Acciones')), // Columna para los iconos de acción
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Andrés Felipe')),
              DataCell(_buildStatusCell(true)),
              DataCell(_buildActionsCell(context)), // Icono de ojo
            ]),
            DataRow(cells: [
              DataCell(Text('Katherin Cadavid Montoya')),
              DataCell(_buildStatusCell(false)),
              DataCell(_buildActionsCell(context)), // Icono de ojo
            ]),
            // ... Agregar más filas según sea necesario
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCell(bool isActive) {
    final bgColor = isActive ? Colors.green[100] : Colors.red[100];
    final textColor = isActive ? Colors.green[800] : Colors.red[800];
    final statusText = isActive ? 'Activo' : 'Inactivo';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        statusText,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: textColor,
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
      builder: (context) => ClientDetailsPage(
        name: 'Andrés Felipe',
        phone: '3052751668',
        email: 'cliente@example.com',
        center: 'CESGUE',
        area: 'MEDELLÍN',
        regional: 'ANTIOQUIA',
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

