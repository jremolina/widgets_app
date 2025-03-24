import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbars y dialogos')),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.info_outline),
        onPressed: () => showsnackbar(context),
        label: Text('Mostrar snackbar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [Text('lorem ipsum')],
                );
              },
              child: Text('Licencias Usadas'),
            ),
            SizedBox(height: 20),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text('Mostrar dialogo'),
            ),
          ],
        ),
      ),
    );
  }

  void showsnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Hola'),
        action: SnackBarAction(label: 'OK', onPressed: () {}),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder:
          (context) => AlertDialog(
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: Text('Cancelar'),
              ),
              FilledButton(
                onPressed: () => context.pop(),
                child: Text('Aceptar'),
              ),
            ],
            title: Text('Estas Seguro'),
            content: Text('Texto de relleno aqui'),
          ),
    );
  }
}
