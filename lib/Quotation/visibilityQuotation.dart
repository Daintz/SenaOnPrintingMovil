import 'package:flutter/material.dart';

class Product {
  final String name;
  final int quantity;
  final double price;
  final String serviceType;

  Product(this.name, this.quantity, this.price, this.serviceType);
}

// ignore: use_key_in_widget_constructors
class QuotationForm extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
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
        title: const Text('Cotizaciones'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77), // Color RGB personalizado
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: codigoController,
              decoration: const InputDecoration(
                labelText: 'Código',
              ),
              readOnly: true,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: fechaOrdenController,
              decoration: const InputDecoration(
                labelText: 'Fecha de orden',
              ),
              readOnly: true,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: fechaEntregaController,
              decoration: const InputDecoration(
                labelText: 'Fecha de entrega',
              ),
              readOnly: true,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: clienteController,
              decoration: const InputDecoration(
                labelText: 'Cliente',
              ),
              readOnly: true,
            ),
            const SizedBox(height: 16.0),
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
             const SizedBox(height: 16.0),
            TextFormField(
              controller: totalValueController,
              decoration: const InputDecoration(
                labelText: 'Valor total de la cotización',
              ),
              readOnly: true,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el botón "No aprobar"
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('No aprobar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para el botón "Aprobar"
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text('Aprobar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
