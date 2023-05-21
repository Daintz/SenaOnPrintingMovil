import 'package:flutter/material.dart';
import 'package:senaonprintingmovil/models/side_menus.dart';

class SideMenuTitle extends StatelessWidget {
  const SideMenuTitle({
    Key? key,
    required this.menu,
    required this.press,
    required this.isActived,
  }) : super(key: key);

  final sideMenus menu;
  final VoidCallback press;
  final bool isActived;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white24,
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              height: 56,
              width: isActived ? 288 : 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xFF6792FF),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 34,
                width: 34,
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              title: Text(menu.title, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }
}
