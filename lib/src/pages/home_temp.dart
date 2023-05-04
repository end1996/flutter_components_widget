import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  HomePageTemp({super.key});

  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homa Page Temp'),
      ),
      body: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        // children: _crearItems(),
        children: _crearItemsCorta(),
      ),
    );
  }

  //Primera forma para crear listas estática
  List<Widget> _crearItems() {
    List<Widget> lista = [];
    for (String item in opciones) {
      final tempWidget = ListTile(
        title: Text(item),
      );
      lista
        ..add(tempWidget)
        ..add(
            const Divider()); //los dos puntos indican la cascada y ahorra escribir código

    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {
    return opciones.map( (item) {
        return Column(
          children: [
            ListTile(
              leading: const Icon(Icons.wifi_password),
              title: Text(item),
              subtitle: const Text('Esto es un subtitulo'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {},
              dense: true,
            ),
            const Divider(),
          ],
        );
      }).toList();
  }
}
