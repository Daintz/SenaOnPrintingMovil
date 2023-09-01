import 'package:flutter/material.dart';
import 'package:senaonprintingmovil/components/Loteo/purchase_supply_view.dart';
import 'package:senaonprintingmovil/components/OrderProduction/order_production_view.dart';
import 'package:senaonprintingmovil/components/Quotation/quotation_view.dart';
import 'package:senaonprintingmovil/components/Client/clients_view.dart';
import 'components/Products/products_view.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}
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
class MyApp extends StatelessWidget {
MaterialColor customColor = MaterialColor(0xff00324D, color);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch:customColor = MaterialColor(0xff00324D, color)),
      debugShowCheckedModeBanner: false,
      initialRoute: '/Login',
      routes: {
        '/Login': (context) => Login(),
        '/': (context) => HomeScreen(),
        //'/menu': (context) => MainScreen(),
        '/clients': (context) => ClientsView(),
        '/quotation': (context) => QuotationClientView(),
        '/order_production': (context) => OrderProduction(),
        '/loteo': (context) => PurchaseSupplyView(),
        '/products': (context) => ProductsView(),
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(alignment: Alignment.bottomCenter, backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.output_outlined, color: Colors.red),
                    SizedBox(width: 10),
                    const Text("Cerrar Sesion", style: TextStyle(color: Colors.red))
                  ]
                )
              ),
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
                    Icons.shopping_basket,
                    'Productos',
                    Color.fromARGB(206, 0, 49, 77),
                    '/products',
                  ),
                  SizedBox(width: 20),
                  _buildButtonWithIcon(
                    context,
                    Icons.shopping_cart,
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
                    Icons.shopping_bag,
                    'Compra Insumos',
                   Color.fromARGB(187, 56, 169, 0),
                    '/loteo',
                  ),
                  SizedBox(width: 20),
                  _buildButtonWithIcon(
                    context,
                    Icons.auto_awesome_motion_rounded,
                    'Insumos',
                   Color.fromARGB(130, 56, 169, 0),
                    '/supply', // Agrega la ruta correspondiente
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

