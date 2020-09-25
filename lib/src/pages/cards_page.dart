//import 'dart:html';

import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2()
        ],
      ),
    );
  }

  Widget _cardTipo1(){

    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),

      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Tarjeta número 1'),
            subtitle: Text('Aquí va el contenido de la primera tarjeta donde se añade una descripcion de la misma'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            FlatButton(
              child: Text('Cancelar'),
              onPressed: (){},
            ),
            FlatButton(
              child: Text('Aceptar'),
              onPressed: (){},
            )
            ]
          )
        ],
      ),
      );
  }

  Widget _cardTipo2(){

    final card = Container(
      //clipBehavior: Clip.antiAlias,

      child: Column(
        children: <Widget>[

          FadeInImage(
            image: NetworkImage('https://www.journeymexico.com/wp-content/uploads/2013/03/mexico-landscapes.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250.0,
            fit: BoxFit.cover,
          ),

          /*Image(
            image: NetworkImage('https://www.journeymexico.com/wp-content/uploads/2013/03/mexico-landscapes.jpg')
          ),*/
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Viajes México')
          )
        ],
      ),
    );

    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(5.0, 10.0)
          )
        ]
      ),
    );

  }
}