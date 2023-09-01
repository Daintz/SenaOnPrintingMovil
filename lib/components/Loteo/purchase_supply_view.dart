import 'package:flutter/material.dart';
import 'purchase_supply_details.dart'; // Importa la página de detalles de compra de suministros
import 'purchase_supply_data.dart'; // Importa los datos de los suministros de compra

class PurchaseSupplyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compra de insumos'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            purchase_supply_Data.length,
            (index) => PurchaseSupplyCard(
              purchaseSupplyData: purchase_supply_Data[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PurchaseSupplyDetailsPage(
                      purchaseSupplyData: purchase_supply_Data[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PurchaseSupplyCard extends StatelessWidget {
  final Map<String, dynamic> purchaseSupplyData;
  final VoidCallback onTap;

  PurchaseSupplyCard({
    required this.purchaseSupplyData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool statedAt = purchaseSupplyData['statedAt'] ?? false;

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
                Icons.shopping_cart,
                size: 36,
              ),
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bodega: ${purchaseSupplyData['bodega']}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
                Text('Fecha Inicio: ${purchaseSupplyData['FechaInicio']}'),
                Text('Vencimiento: ${purchaseSupplyData['FechaVencimiento']}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
