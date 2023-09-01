import 'package:flutter/material.dart';

class PurchaseSupplyDetailsPage extends StatelessWidget {
  final Map<String, dynamic> purchaseSupplyData;

  PurchaseSupplyDetailsPage({
    required this.purchaseSupplyData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle Compra Insumos'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailRow('Bodega', purchaseSupplyData['bodega']),
              _buildDetailRow('Fecha de Inicio', purchaseSupplyData['FechaInicio']),
              _buildDetailRow('Fecha de Vencimiento', purchaseSupplyData['FehaVencimiento']),
              _buildSupplyList(purchaseSupplyData['supplys'], context), // Pasar el contexto
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label + ':',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildSupplyList(List<Map<String, dynamic>> supplys, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: supplys.map((supply) {
        return GestureDetector(
          onTap: () {
            _showSupplyDetails(context, supply); // Mostrar el modal de detalles de suministros
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    supply['Nombre'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  trailing: Text(
                    'Cantidad: ${supply['Cantidad']}',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Indicadores de Peligrosidad: ${supply['IndicadoresDePeligrosidad']}',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 6),
                Text(
                  'Tipo de Insumo: ${supply['TipoDeInsumo']}',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  void _showSupplyDetails(BuildContext context, Map<String, dynamic> supply) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SupplyDetailsModal(supply: supply),
    );
  }
}
class SupplyDetailsModal extends StatelessWidget {
  final Map<String, dynamic> supply;

  SupplyDetailsModal({
    required this.supply,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle Insumo'),
        backgroundColor: Color.fromARGB(255, 0, 49, 77),
      ),
      body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Nombre', supply['Nombre']),
            _buildDetailRow('Cantidad', supply['Cantidad']),
            _buildDetailRow('Tipo de Peligrosidad', supply['TipoPeligrosidad']),
            _buildDetailRow('Indicadores de Peligrosidad', supply['IndicadoresDePeligrosidad']),
            _buildDetailRow('Tipo de Insumo', supply['TipoDeInsumo']),
            _buildDetailRow('Instrucciones', supply['Instrucciones']),
            _buildDetailRow('Consejos', supply['Consejos']),
            _buildDetailRow('Costo promedio', supply['CostoPromedio']),
            _buildDetailRow('Estado', supply['estado']),
          ],
        ),
      ),
    )
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label + ':',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

}

