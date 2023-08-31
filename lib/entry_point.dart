import 'package:flutter/material.dart';
//import 'package:rive/rive.dart';
import 'package:senaonprintingmovil/components/side_menu.dart';

import 'models/menu_btn.dart';
import 'screens/home/dashboard_screen.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  late bool isSidebarClosed = true;

  bool isSideMenuClosed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF17203A),
      body: Stack(children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          width: 280,
          left: isSideMenuClosed ? -288 : 0,
          height: MediaQuery.of(context).size.height,
          child: SideMenu(),
        ),
        Transform.translate(
          offset: Offset(isSideMenuClosed ? 0 : 288, 0),
          child: Transform.scale(
              scale: isSidebarClosed ? 1 : 0.8,
              child: const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: DashboardScreen())),
        ),
        MenuBtn(
          press: () {
            isSidebarClosed = !isSidebarClosed;
            setState(() {
              isSideMenuClosed = isSidebarClosed;
            });
          },
        )
      ]),
    );
  }
}
