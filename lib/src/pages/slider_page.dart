import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider')
      ),
      body: Container(
        padding: EdgeInsets.only(top: 32.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ]
        ),
      ),
    );
  }

  Widget _crearSlider(){

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Zoom',
     // divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      //Si no tiene onChanged, es como si estuviera bloqueado, pasa concualquier método
      onChanged: (_bloquearCheck) ? null : (valor){
      //Lo de arriba es una condición. Si bloquearCheck es true entonces se vuelve null el onChenge, de lo contrario ejecuta la función
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _checkBox(){

    /*return Checkbox(
      value: _bloquearCheck, 
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      }
    );*/
    //Otra forma
    return CheckboxListTile(
      title: Text('Bloquear tamaño'),
      value: _bloquearCheck, 
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      }
    );

  }

  Widget _crearSwitch(){

      return SwitchListTile(
      title: Text('Bloquear tamaño'),
      value: _bloquearCheck, 
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      }
    );

  }

  Widget _crearImagen(){

    return Image(
      image: NetworkImage('https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Poppy_5.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );

  }
}