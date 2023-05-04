import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  // String _fecha = "";
  String _opcionSeleccionada = 'Rasengan';
  
  final List<String> _poderes = <String> ['Rasengan','Shidori','Raikiri'];

  final TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs de texto'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearFecha(),
          const Divider(),
          _crearDropdown(),
          const Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        helperText: 'Sólo es el nombre',
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        icon: Icon(Icons.account_circle),
        suffixIcon: Icon(Icons.accessibility),
        counter: Text('Letras ${_nombre.length}'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onChanged: (value) {
        // print(_nombre);
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        labelText: 'Email',
        icon: Icon(Icons.email),
        suffixIcon: Icon(Icons.alternate_email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onChanged: (value) {
        // print(_nombre);
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        icon: Icon(Icons.lock),
        suffixIcon: Icon(Icons.lock_open),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  Widget _crearFecha() {
    return TextField(
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        icon: Icon(Icons.calendar_today),
        suffixIcon: Icon(Icons.calendar_month),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(FocusNode());
          selectDate(context);
        });
      },
    );
  }

  List<DropdownMenuItem<String>> getOptionsDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((dropdownValue) {
      lista.add(DropdownMenuItem(
        value: dropdownValue,
        child: Text(dropdownValue),
        )
        );
    },
    );
    return lista;
  }

  Widget _crearDropdown() {

    return Row(
      children: [
        const Icon(Icons.select_all),
        DropdownButton(
          value: _opcionSeleccionada,
          items: getOptionsDropdown(),
          onChanged: (value) {
          setState(() => _opcionSeleccionada = value!);
        }),
      ],
    );
   }


  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
    );
  }
  
  void selectDate(BuildContext context) async {

       DateTime? picked = await showDatePicker(
        locale: const Locale('es'),
      context: context, initialDate: DateTime.now(),
       firstDate: DateTime(2022), 
       lastDate: DateTime(2024));


      setState(() {
        if(picked != null){
          //Al utilizar Dateformat no es necesario hacer la conversión a String
          //Se debe intalar la dependencia intl e importarla al proyecto
        // _fecha = picked.toString();
        // _inputFieldDateController.text = _fecha;
        _inputFieldDateController.text = DateFormat('dd-MM-yyyy').format(picked);
        }
        
      });
  }
  
  
}
