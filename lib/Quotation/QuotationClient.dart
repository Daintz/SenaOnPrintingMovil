import 'package:flutter/material.dart';
import 'package:senaonprintingmovil/Quotation/visibilityQuotation.dart';


class QuotationClient extends StatelessWidget {
  const QuotationClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cotizaciones'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DataTable(
              columns: [
                DataColumn(label: Text('Código')),
                DataColumn(label: Text('Fecha orden')),
                DataColumn(label: Text('Cliente')),
                DataColumn(label: Text('Acciones')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('0001')),
                  DataCell(Text('2023-08-24')),
                  DataCell(Text('JHON')),
                  DataCell(IconButton(
                    icon: Icon(Icons.visibility_rounded),
                    onPressed: () {
                       Navigator.push(
            context, MaterialPageRoute(
              builder: (context)=> QuotationForm()));
                    },
                  )),
                ]),
                DataRow(cells: [
                  DataCell(Text('0002')),
                  DataCell(Text('2023-08-25')),
                  DataCell(Text('ROJAS')),
                  DataCell(IconButton(
                    icon: Icon(Icons.visibility_rounded),
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
