import 'package:flutter/material.dart';
import 'client_details_page.dart';
import 'client_data.dart';

class ClientsView extends StatefulWidget {
  @override
  _ClientsViewState createState() => _ClientsViewState();
}

class _ClientsViewState extends State<ClientsView> {
  late Future<List<Map<String, dynamic>>> clientData;

  @override
  void initState() {
    super.initState();
    // Inicializa la carga de datos cuando se crea la vista
    clientData = fetchClientData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        // Utiliza la variable clientData que contiene los datos de la API
        future: clientData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras se obtienen los datos
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Muestra un mensaje de error si no se pueden obtener los datos
            return Center(child: Text('Error al cargar los datos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Muestra un mensaje si no hay datos disponibles
            return Center(child: Text('No se encontraron clientes'));
          } else {
            // Muestra la lista de clientes obtenida de la API
            final clientData = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  clientData.length,
                  (index) => ClientCard(
                    clientData: clientData[index],
                    onTap: () {
                      _showClientDetails(context, index);
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _showClientDetails(BuildContext context, int index) async {
  final data = await clientData; // Esperar a que clientData se resuelva
  showModalBottomSheet(
    context: context,
    builder: (context) => ClientDetailsPage(
      clientData: data[index],
    ),
  );
}
}
class ClientCard extends StatelessWidget {
  final Map<String, dynamic> clientData;
  final VoidCallback onTap;

  ClientCard({
    required this.clientData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool statedAt = clientData['statedAt'];

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              width: 6,
              height: 80,
              color: statedAt ? Colors.green : Colors.red,
            ),
            SizedBox(width: 12),
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Icon(
                Icons.person_rounded,
                size: 56,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clientData['name'],
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                    ),
                    Text('Teléfono: ${clientData['phone']}'),
                    Text(
                      'Correo: ',
                      style: TextStyle( fontSize: 16.0),
                    ),
                    Text(
                      clientData['email'],
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      'Centro: ',
                      style: TextStyle( fontSize: 16.0),
                    ),
                    Text(
                      clientData['center'],
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
            ),
        )],
        ),
      ),
    );
  }
}
