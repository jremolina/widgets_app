import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';
//import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter + Material 3')),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListView.builder(
      //addAutomaticKeepAlives: false,
      itemCount: appMenuItems.length,
      itemBuilder: (BuildContext context, int index) {
        final menuItem = appMenuItems[index];
        return ListTile(
          title: Text(menuItem.title),
          subtitle: Text(menuItem.subtitle),
          leading: Icon(menuItem.icon, color: colors.primary),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: colors.primary,
          ),

          onTap: () {
            context.push(menuItem.link);
          },
        );
      },
    );
  }
}
