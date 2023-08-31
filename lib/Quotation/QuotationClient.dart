import 'package:flutter/material.dart';
import 'package:senaonprintingmovil/Quotation/visibilityQuotation.dart';


class QuotationClient extends StatelessWidget {
  QuotationClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotizaciones'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77), // Color RGB personalizado
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DataTable(
              columns:const [
                DataColumn(label: Text('Código')),
                DataColumn(label: Text('Fecha orden')),
                DataColumn(label: Text('Cliente')),
                DataColumn(label: Text('Acciones')),
              ],
              rows: [
                DataRow(cells: [
                  const DataCell(Text('0001')),
                  const DataCell(Text('2023-08-24')),
                  const DataCell(Text('JHON')),
                  DataCell(IconButton(
                    icon: const Icon(Icons.visibility_rounded),
                    onPressed: () {
                       Navigator.push(
            context, MaterialPageRoute(
              builder: (context)=> QuotationForm()));
                    },
                  )),
                ]),
                DataRow(cells: [
                  const DataCell(Text('0002')),
                  const DataCell(Text('2023-08-25')),
                  const DataCell(Text('ROJAS')),
                  DataCell(IconButton(
                    icon: const Icon(Icons.visibility_rounded),
                    onPressed: () {
                      // Lógica para manejar el evento del botón
                    },
                  )),
                ]),
                // Agrega más filas según tus necesidades
              ],
            ),
          ],
        ),
      ),
    );
  }
}
