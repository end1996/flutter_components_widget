import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          cardTipo1(),
          SizedBox(height: 30),
          cardTipo2(),
          SizedBox(height: 30),
          cardTipo1(),
          SizedBox(height: 30),
          cardTipo2(),
          SizedBox(height: 30),
          cardTipo1(),
          SizedBox(height: 30),
          cardTipo2(),
          SizedBox(height: 30),
          cardTipo1(),
          SizedBox(height: 30),
          cardTipo2(),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget cardTipo1() {
    return Card(
      elevation: 20.0,
      
      // margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Título Card'),
            subtitle: Text(
                'If the [style] argument is null, the text will use the style from the closest enclosing [DefaultTextStyle].'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(onPressed: (() {}), child: const Text('Cancelar')),
              OutlinedButton(onPressed: (() {}), child: const Text('OK')),
            ],
          ),
        ],
      ),
    );
  }

  Widget cardTipo2() {
    //Se terminó cambiando a un container ya que no se respetaban las propiedades de los border en el Card
    final card = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FadeInImage(
            placeholder: AssetImage('assets/073 jar-loading.gif'),
            image: NetworkImage(
                'https://static.vecteezy.com/system/resources/previews/003/623/626/original/sunset-lake-landscape-illustration-free-vector.jpg'),
            fit: BoxFit.cover,
            height: 280,
            fadeInDuration: Duration(milliseconds: 200),
          ),
          Container(
              padding: EdgeInsets.all(10.0), child: Text('Aquí va un título')),
        ],
      ),
    );
    //Esta parte es la encargada se redondear los border y aplicar la sombra
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: const <BoxShadow> [
          BoxShadow(
            blurRadius: 10.0,
            offset: Offset(2, 10),
            color: Colors.black26,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: ClipRRect(
        // clipBehavior: Clip.antiAlias, Esta propiedad es para ajustar los border pero no siempre funciona
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
