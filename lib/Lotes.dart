import 'package:flutter/material.dart';
import 'loteoInsumos.dart';
import 'lotesList.dart';
import 'InsumoDetail.dart';
class Lotes extends StatelessWidget {
  const Lotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lotes')),
        body: ListView.separated(
          itemCount: LotesList.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      '${LotesList[index]['bodega']} / ${LotesList[index]['FechaInicio']}'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoteoInsumos()));
                      },
                      child: Text('Ver insumos'))
                ],
              ),
            );
          },
        ));
  }
}
