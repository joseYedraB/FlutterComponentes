import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedCOntainerPage extends StatefulWidget {
  @override
  _AnimatedCOntainerPageState createState() => _AnimatedCOntainerPageState();
}

class _AnimatedCOntainerPageState extends State<AnimatedCOntainerPage> {
  //Estas propiedades son las que va a utilizar el container
  double _width  = 50.0;
  double _height = 50.0;
  Color _color = Colors.red;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contenido animado'),
      ),
        body: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              color: _color
            ),
          ),
        ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _cambiarForma,
      ),

    );

  }

  void _cambiarForma(){
      
    final random = Random();

      setState(() {
      _width  = random.nextInt(300).toDouble();
      _height = random.nextInt(300).toDouble();
      _color  =  Color.fromRGBO(
                  random.nextInt(255), 
                  random.nextInt(255),
                  random.nextInt(255),
                  1
                  );  
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
      });
    }

}