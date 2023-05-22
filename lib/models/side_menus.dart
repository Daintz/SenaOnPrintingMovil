import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/categorysupply/category_supply_screen.dart';
import '../screens/home/dashboard_screen.dart';
import '../screens/supply/supply_screen.dart';

class sideMenus {
  final String artboard, stateMachineName, title, src;
  final Widget destination;

  sideMenus(this.src,
    {required this.artboard,
    required this.stateMachineName,
    required this.title,
    required this.destination});
}

List<sideMenus> sideMenusObject = [
  sideMenus("Icon(Icons.home)", artboard: "HOME", stateMachineName: "HOME_interactivity", title: "Bienvenida", destination: DashboardScreen()),
  sideMenus("../", artboard: "SUPPLIES", stateMachineName: "SUPPLIES_interactivity", title: "Insumos", destination: SupplyScreen()),
  sideMenus("../", artboard: "CATEGORYSUPPLY", stateMachineName: "CATEGORYSUPPLY_interactivity", title: "Categoria Insumos", destination: CategorySupplyScreen()),
];