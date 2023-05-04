import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 150.0;
  bool _botonCheck = false;
  bool _botonSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider Page'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 25.0),
          _crearSlider(),
          _crearImagen(),
          _crearCheckbox(),
          _crearSwitch(),
        ],
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        label: 'Aumentar tamaño de imágen',
        activeColor: Colors.indigo,
        min: 150.0,
        max: 300.0,
        value: _sliderValue,
        onChanged: (_botonCheck)
            ? (valor) {
                setState(() {
                  _sliderValue = valor;
                });
              }
            : null
            );
  }

  Widget _crearImagen() {
    return Column(
      children: [
        FadeInImage(
          placeholder: const AssetImage('assets/073 jar-loading.gif'),
          image: const NetworkImage(
              'https://e.rpp-noticias.io/normal/2022/05/28/265926_1265286.jpg'),
          fit: BoxFit.contain,
          height: _sliderValue,
        ),
        const Divider(
          height: 20.0,
        ),
        FadeInImage(
          placeholder: const AssetImage('assets/073 jar-loading.gif'),
          image: const NetworkImage(
              'https://img.asmedia.epimg.net/resizer/tWzd2qIfBixwIilTApSTL6GVyXo=/1952x1098/cloudfront-eu-central-1.images.arcpublishing.com/diarioas/33BJTAXAFFP5HEBATEFA3MITRM.jpg'),
          fit: BoxFit.contain,
          height: _sliderValue,
        ),
      ],
    );
  }

  Widget _crearCheckbox() {
    return CheckboxListTile(
        title: const Text('Activar Slider'),
        subtitle: const Text('CheckBox Example'),
        value: _botonCheck,
        onChanged: ((value) {
          setState(() {
            _botonCheck = value!;
          });
        }));
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: const Text('Activar Slider'),
        subtitle: const Text('Switch Example'),
        value: _botonSwitch,
        onChanged: ((value) {
          setState(() {
            _botonSwitch = value;
          });
        }));
  }
}
