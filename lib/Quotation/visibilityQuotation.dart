import 'package:flutter/material.dart';

class Product {
  final String name;
  final int quantity;
  final double price;
  final String serviceType;

  Product(this.name, this.quantity, this.price, this.serviceType);
}

class QuotationForm extends StatefulWidget {
  @override
  _QuotationFormState createState() => _QuotationFormState();
}

class _QuotationFormState extends State<QuotationForm> {
  TextEditingController codigoController =
      TextEditingController(text: '0001');
  TextEditingController fechaOrdenController =
      TextEditingController(text: '2023-08-24');
  TextEditingController fechaEntregaController =
      TextEditingController(text: '2023-08-31');
  TextEditingController clienteController =
      TextEditingController(text: 'John Doe');
  TextEditingController totalValueController =
      TextEditingController(text: '50.00');

  String selectedProduct = '';

  List<Product> productList = [
    Product('Product 1', 2, 10.0, 'Service A'),
    Product('Product 2', 1, 20.0, 'Service B'),
    Product('Product 3', 3, 5.0, 'Service C'),
    Product('Product 4', 4, 15.0, 'Service A'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quotation Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: codigoController,
              decoration: InputDecoration(
                labelText: 'Código',
              ),
              readOnly: true,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: fechaOrdenController,
              decoration: InputDecoration(
                labelText: 'Fecha de orden',
              ),
              readOnly: true,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: fechaEntregaController,
              decoration: InputDecoration(
                labelText: 'Fecha de entrega',
              ),
              readOnly: true,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: clienteController,
              decoration: InputDecoration(
                labelText: 'Cliente',
              ),
              readOnly: true,
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(productList[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cantidad: ${productList[index].quantity}'),
                        Text('Precio: \$${productList[index].price.toStringAsFixed(2)}'),
                        Text('Tipo de servicio: ${productList[index].serviceType}'),
                      ],
                    ),
                  );
                },
              ),
            ),
             SizedBox(height: 16.0),
            TextFormField(
              controller: totalValueController,
              decoration: InputDecoration(
                labelText: 'Valor total de la cotización',
              ),
              readOnly: true,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el botón "No aprobar"
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Text('No aprobar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el botón "Aprobar"
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                  child: Text('Aprobar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
