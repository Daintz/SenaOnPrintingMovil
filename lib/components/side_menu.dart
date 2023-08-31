import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senaonprintingmovil/models/side_menus.dart';

import 'info_card.dart';
import 'side_menu_title.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  sideMenus selectedMenu = sideMenusObject.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InfoCard(
                name: "User",
                role: "Administrator",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Dashboard".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenusObject.map((menu) => SideMenuTitle(
                    menu: menu,
                    press: () {
                      setState(() {
                        selectedMenu = menu;
                      });
                    },
                    isActived: selectedMenu == menu,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
