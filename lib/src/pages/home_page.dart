import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icons_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //  print(menuProvider.opciones) ;

    //De esta manera no asegura que cargue del todo la aplicación y puede que se trabe, no es la mejor opción
    //  menuProvider.cargarData().then((opciones) {
    //   print('_lista');
    //    print(opciones);

    //  },);

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: const [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        // print('builder');
        // print(snapshot.data);
        return ListView(
          children: _listaItems(snapshot.requireData, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, context) {
    final List<Widget> lista = [];
    data.forEach((elementJson) {
      final widgetTemp = ListTile(
        title: Text(elementJson['texto']),
        leading: getIcon(elementJson['icon']),
        trailing: const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.amber,
        ),
        onTap: () {
          //Esta manera es mas utilizada y es mas ordenada
          Navigator.pushNamed(context, elementJson['ruta']);

          //Esta manera no es la más óptima para navegar entre pantallas
          // final route = MaterialPageRoute(builder: (context) => const AlertPage(),);
          // Navigator.push(context, route);
        },
      );

      lista
        ..add(widgetTemp)
        ..add(const Divider());
    });
    return lista;
  }
}
