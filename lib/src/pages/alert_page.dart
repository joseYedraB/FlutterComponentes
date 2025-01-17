import 'package:flutter/material.dart';


class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text ('Alert Page'),
      ),

      body: Center(
        child: RaisedButton(
          child: Text('Mostrar Alerta'),
          textColor: Colors.white,
          color: Colors.blue,
          shape: StadiumBorder(),
          onPressed: () => _mostrarAlert(context),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.flip_to_back),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlert(BuildContext context){

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){

        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text('Título'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Contenido de la alerta'),
              FlutterLogo(size:50.0)
            ]
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar')
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Ok')
            )
          ],
        );

      }
    );

  }

}