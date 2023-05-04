import 'dart:async';

import 'package:flutter/material.dart';

class ListBuilderPage extends StatefulWidget {
  const ListBuilderPage({super.key});

  @override
  State<ListBuilderPage> createState() => _ListBuilderPageState();
}

class _ListBuilderPageState extends State<ListBuilderPage> {
  final ScrollController _scrollController = ScrollController();
  final List<int> _numberList = [];
  int _ultimoNumero = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregarImagenes();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregarImagenes();
        _fetchData();//Método para traer información
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose(); //Se encarga de vaciar el caché del Scroll
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Builder Page'),
      ),
      body: Stack(
        children: [
          _crearListBuilder(),
          _crearLoading(),
        ],
      )
      
    );
  }

  Widget _crearListBuilder() {
    //Se hizo wrap al ListView con un RefreshIndicador para obtener el pull to refresh
    //Se llama una función Future para obtener nuevas imágenes en 2seg
    return RefreshIndicator(
      onRefresh: _obtainNewPage,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _numberList.length,
          itemBuilder: ((BuildContext context, int index) {
            final imagen = _numberList[index];
    
            return SizedBox(
              //Se agrega un SizedBox para que no parezca que la imagen se sale del contenido al cargar
              height: 300,
              child: FadeInImage(
                placeholder: const AssetImage('assets/073 jar-loading.gif'),
                image: NetworkImage('https://picsum.photos/id/$imagen/500/300'),
                fit: BoxFit.cover,
                //aplicar estas propiedades acá no es lo más adecuado
                // fadeInDuration: const Duration(milliseconds: 200),
                // fadeInCurve: Curves.fastOutSlowIn,
              ),
            );
          })),
    );
  }

  void _agregarImagenes() {
    for (var i = 1; i < 10; i++) {
      _ultimoNumero++;
      _numberList.add(_ultimoNumero);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});
    const duration = Duration(seconds: 2);
    return Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels +100, 
      duration: const Duration(microseconds: 250), 
      curve: Curves.fastOutSlowIn,
      );
    _agregarImagenes();
  }
  
  Widget _crearLoading() {

    CircularProgressIndicator loading = const CircularProgressIndicator(
      strokeWidth: 8.0,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.symmetric(horizontal: 0.0,vertical: 30.0)),
            //Se aplica operador ternario para la misma funcionalidad
            _isLoading ? loading: const Text('Arrastra para cargar mas imágenes')
          ],
        ),
      ]
    );

    //De esta manera fue hecha pero no fue funcional para mi caso
    // _isLoading = true;
    // setState(() {
      
    // });
    // if(_isLoading) {
    //   return const CircularProgressIndicator();
    // } else {
    //   return Container();
    // } 
   }

  Future<void> _obtainNewPage() async {
    final duration = Duration(seconds: 2);
    Timer(duration, (() {
      
      _numberList.clear();
      _ultimoNumero++;
      _agregarImagenes();
    }));
    return Future.delayed(duration);
  }
}
