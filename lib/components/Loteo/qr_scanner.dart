
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:senaonprintingmovil/components/Loteo/webview.dart';
import 'package:url_launcher/url_launcher.dart';

class QRScannerView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => QRScannerViewState();
}

class QRScannerViewState extends State<QRScannerView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isScanning = true; // Agregar un indicador para controlar la detección

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escáner de QR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text('Apunta a un código QR para escanearlo'),
            ),
          ),
        ],
      ),
    );
  }
  void _showQRCode(String code) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Código QR escaneado'),
          content: Text(code),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

// Función para mostrar el código QR
void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (isScanning) { // Verificar si se está escaneando
        isScanning = false; // Desactivar temporalmente la detección

        if (scanData.code != null) {
          // Verificar si el código escaneado es un enlace web
          if (Uri.tryParse(scanData.code.toString())?.hasScheme ?? false) {
            _launchURL(scanData.code.toString());
          } else {
            // Si no es un enlace, mostrar el código
            _showQRCode(scanData.code.toString());
          }
        }

        // Reactivar la detección después de un breve retraso
        Future.delayed(Duration(seconds: 2), () {
          isScanning = true;
        });
      }
    });
  }

// Función para abrir un enlace en el navegador
void _launchURL(String url) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => WebViewPage(url)),
  );
}
}