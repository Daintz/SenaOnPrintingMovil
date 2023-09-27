import 'package:flutter/material.dart';
import 'package:senaonprintingmovil/components/Insumo/insumo_view.dart';
import 'package:senaonprintingmovil/components/Loteo/purchase_supply_view.dart';
import 'package:senaonprintingmovil/components/Loteo/qr_scanner.dart';
import 'package:senaonprintingmovil/components/OrderProduction/order_production_view.dart';
import 'package:senaonprintingmovil/components/Quotation/quotation_view.dart';
import 'package:senaonprintingmovil/components/Client/clients_view.dart';
import 'components/Products/products_view.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

Map<int, Color> color = {
  50: const Color(0xff82def0),
  100: Color(0xFF69BED8),
  200: const Color(0xff5fafc7),
  300: Color(0xFF4792AF),
  400: const Color(0xff3e839e),
  500: const Color(0xff205975),
  600: const Color(0xff00324D),
  700: Color(0xFF183E52),
  800: Color(0xFF12394E),
  900: const Color(0xff00324D),
};

class MyApp extends StatelessWidget {
  MaterialColor customColor = MaterialColor(0xff00324D, color);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: customColor = MaterialColor(0xff00324D, color)),
      debugShowCheckedModeBanner: false,
      initialRoute: '/Login',
      routes: {
        '/Login': (context) => Login(),
        '/': (context) => HomeScreen(),
        '/clients': (context) => ClientsView(),
        '/quotation': (context) => QuotationClientView(),
        '/order_production': (context) => orderProductionsView(),
        '/loteo': (context) => supplysDetailsView(),
        '/products': (context) => ProductsView(),
        '/supply': (context) => supplysView(),
        '/qr_scanner': (context) => QRScannerView(), // Agregamos la ruta para el escáner QR
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/logo_sena.jpeg',
                    width: 300, // Ancho de la imagen
                    height: 150, // Altura de la imagen
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButtonWithIcon(
                        context,
                        Icons.ballot,
                        'Productos',
                        Color.fromARGB(206, 0, 49, 77),
                        '/products',
                      ),
                      SizedBox(width: 20),
                      _buildButtonWithIcon(
                        context,
                        Icons.people_alt,
                        'Clientes',
                        Color.fromARGB(141, 0, 49, 77),
                        '/clients',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButtonWithIcon(
                        context,
                        Icons.request_quote,
                        'Cotización',
                        Color.fromARGB(255, 130, 222, 240),
                        '/quotation',
                      ),
                      SizedBox(width: 20),
                      _buildButtonWithIcon(
                        context,
                        Icons.checklist,
                        'Orden Producción',
                        Color.fromARGB(154, 130, 222, 240),
                        '/order_production',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButtonWithIcon(
                        context,
                        Icons.add_shopping_cart_rounded,
                        'Compra Insumos',
                        Color.fromARGB(187, 56, 169, 0),
                        '/loteo',
                      ),
                      SizedBox(width: 20),
                      _buildButtonWithIcon(
                        context,
                        Icons.shelves,
                        'Insumos',
                        Color.fromARGB(130, 56, 169, 0),
                        '/supply',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Agregamos el botón para el escáner QR
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/qr_scanner');
                },
                child: Text('Escanear QR'),
              ),
              Container(
                width: 320,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.bottomCenter,
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.output_outlined,
                        color: Colors.red,
                        size: 30,
                      ),
                      SizedBox(width: 10),
                      const Text(
                        "Cerrar sesión",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonWithIcon(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
    String route,
  ) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
            icon: Icon(
              icon,
              size: 50,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}