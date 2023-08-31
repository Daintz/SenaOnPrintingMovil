import 'package:flutter/material.dart';
import './Pum.dart';
import './Lotes.dart';
import 'package:senaonprintingmovil/Client/Client.dart';
import 'package:senaonprintingmovil/OrderProduction/OrderProduction.dart';
import 'package:senaonprintingmovil/Quotation/QuotationClient.dart';

Map<int, Color> color =
{
  50:  const Color(0xff82def0),
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

MaterialColor customColor = MaterialColor(0xff00324D, color);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/clients': (context) => Clients(),
        '/quotation': (context) => QuotationClient(),
        '/order_production': (context) => OrderProduction(),
        '/loteo': (context) => Lotes(),
        //Aqui se agregan la ruta a donde va a ir el boton
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'SENA ON PRINTING',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButtonWithIcon(
                    context,
                    Icons.shopping_basket,
                    'Productos',
                    Color(0xFFAED9E0),
                    '/products',
                  ),
                  SizedBox(width: 20),
                  _buildButtonWithIcon(
                    context,
                    Icons.shopping_cart,
                    'Clientes',
                    Color(0xFFC7C6A5),
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
                    Color(0xFFE5B9B0),
                    '/quotation',
                  ),
                  SizedBox(width: 20),
                  _buildButtonWithIcon(
                    context,
                    Icons.checklist,
                    'Orden Producción',
                    Color(0xFFF7EDE2),
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
                    Icons.shopping_bag,
                    'Compra Insumos',
                    Color(0xFFD2E8BB),
                    '/loteo',
                  ),
                  SizedBox(width: 20),
                  _buildButtonWithIcon(
                    context,
                    Icons.auto_awesome_motion_rounded,
                    'Insumos',
                    Color(0xFFD2E8BB),
                    '/insumos', // Agrega la ruta correspondiente
                  ),
                ],
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
    String route, // Nueva adición
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
              )),
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

