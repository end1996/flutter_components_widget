
import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';


class _MenuProvider {

  List<dynamic> opciones = [];

//no se puede hacer un constructor asíncrono
  _MenuProvider() {
    //al usar Future ya no es necesario inicializar acá el constructor
    // cargarData();
  }
  
  //conversion de String a Map, es necesario usar la libreria dart:convert para usar las propiedades de json
  //de esta manera no se cargar los datos de manera óptima se hace necesario usar async, await y por tanto future
//   void cargarData() {
// rootBundle.loadString('data/065 menu-opts.json').then((value) {
//   Map dataMap = json.decode(value);
//   print(dataMap['rutas']);
//   opciones = dataMap['rutas'];
// });
//   }
// }

Future<List<dynamic>> cargarData() async {
 
final resp = await rootBundle.loadString('data/065 menu-opts.json');

 Map dataMap = json.decode(resp);
  // print(dataMap['rutas']);
  opciones = dataMap['rutas'];

  return opciones;
}
  
}


final menuProvider = _MenuProvider();