import 'package:flutter/material.dart';
import 'client_details_page.dart';
import 'client_data.dart';

class ClientsView extends StatelessWidget {
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
      body: SingleChildScrollView(
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
      ),
    );
  }

  void _showClientDetails(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ClientDetailsPage(
        clientData: clientData[index],
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
                Icons.supervised_user_circle_sharp,
                size: 56,
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(clientData['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text('Teléfono: ${clientData['phone']}'),
                Text('Correo: ${clientData['email']}'),
                Text('Centro: ${clientData['center']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}