import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_before),
        onPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showAlert(context);
            },
            child: Text('Mostrar alerta')),
      ),
    );
  }

  void showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          title: Text('Título'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Este es el contenido del mensaje de alerta'),
              FlutterLogo(
                size: 100,
              )
            ],
          ),
          actions: [
            TextButton(
                onPressed: (() => Navigator.of(context).pop()),
                child: Text('Cancelar')),
            TextButton(
                onPressed: (() {
                  Navigator.of(context).pop();
                }),
                child: Text('OK'))
          ],
        );
      },
      barrierDismissible: false,
    );
  }
}
