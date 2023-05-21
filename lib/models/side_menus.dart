import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sideMenus {
  final String artboard, stateMachineName, title, src;

  sideMenus(this.src,
    {required this.artboard,
    required this.stateMachineName,
    required this.title});
}

List<sideMenus> sideMenusObject = [
  sideMenus("Icon(Icons.home)", artboard: "HOME", stateMachineName: "HOME_interactivity", title: "Bienvenida"),
  sideMenus("../", artboard: "SUPPLIES", stateMachineName: "SUPPLIES_interactivity", title: "Insumos"),
  sideMenus("../", artboard: "CATEGORYSUPPLY", stateMachineName: "CATEGORYSUPPLY_interactivity", title: "Categoria Insumos"),
];