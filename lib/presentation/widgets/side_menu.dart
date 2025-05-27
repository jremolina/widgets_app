import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 1;

  @override
  Widget build(BuildContext context) {
    final hasnotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);

      

      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasnotch ? 0 : 20, 16, 10),
          child: Text('Main Menu'),
        ),

        ...appMenuItems
            .sublist(0, 3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),

        Padding(padding: EdgeInsets.fromLTRB(28, 16, 28, 10), child: Divider()),

        Padding(
          padding: EdgeInsets.fromLTRB(28, hasnotch ? 0 : 20, 16, 10),
          child: Text('More options'),
        ),

        ...appMenuItems
            .sublist(3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Flexible(
                  child: Text(item.title, overflow: TextOverflow.fade),
                ),
              ),
            ),

        // NavigationDrawerDestination(
        //   icon: Icon(Icons.add_shopping_cart),
        //   label: Text('Otra Pantalla'),
        // ),
      ],
    );
  }
}
