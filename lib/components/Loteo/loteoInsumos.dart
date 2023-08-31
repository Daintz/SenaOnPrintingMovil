import 'package:flutter/material.dart';
import 'InsumoDetail.dart';
import 'List.dart';

class LoteoInsumos extends StatelessWidget {
  const LoteoInsumos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Insumos de bodega'),
         backgroundColor: Color.fromARGB(255, 0, 49, 77), // Color RGB personalizado
         ),
        body: ListView.separated(
          itemCount: Insumos.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${Insumos[index]['Nombre']}'),
                  IconButton(onPressed:(){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:(context)=>
                                InsumoDetalle(insume:Insumos[index])));
                  }, icon: Icon(Icons.visibility),)
                ],
              ),
            );
          },
        ));
  }
}
