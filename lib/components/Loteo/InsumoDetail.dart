import 'package:flutter/material.dart';
import 'List.dart';

class InsumoDetalle extends StatelessWidget {

  dynamic insume;

  InsumoDetalle({super.key, required this.insume});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
         appBar: AppBar(title: const Text('Detalle de insumos'),backgroundColor: Color.fromARGB(255, 0, 49, 77), // Color RGB personalizado
         ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 10), // Espacio entre las filas
              Row(
                children: [
                  Expanded(child: Text('Nombre:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
                  Expanded(child: Text('${insume['Nombre']}')),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Indicadores De Peligrosidad:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
                  Expanded(child: Text('${insume['IndicadoresDePeligrosidad']}')),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Instrucciones:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
                  Expanded(child: Text('${insume['Instrucciones']}')),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Consejos:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
                  Expanded(child: Text('${insume['Consejos']}')),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Tipo De Insumo:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
                  Expanded(child: Text('${insume['TipoDeInsumo']}')),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Tipo de Peligrosidad:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
                  Expanded(child: Text('${insume['TipoPeligrosidad']}')),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Cantidad:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
                  Expanded(child: Text('${insume['Cantidad']}')),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Costo Promedio:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
                  Expanded(child: Text('${insume['CostoPromedio']}')),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text('Estado:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
                  Expanded(child: Text('${insume['estado']}')),
                ],
              ),
            ],
          ),
        )
    );

  }
}