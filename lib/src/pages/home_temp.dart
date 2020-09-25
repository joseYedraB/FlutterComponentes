import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        //children: _crearItems()
        children: _crearItemsCorta()
      ),
    );
  }

  List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) {
      
      final tempWidget = ListTile(
        title: Text(opt),
      );

      lista..add(tempWidget)
           ..add(Divider(thickness: 2.0,));

    }

    return lista;
  }

  //Otra manera de hacerlo

  List<Widget> _crearItemsCorta(){

    var widgets = opciones.map((item){

        return Column(
          children: <Widget>[
            ListTile(
              title: Text(item + '!'),
              subtitle: Text('Sección'),
              leading: Icon(Icons.account_box),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: (){ },
            ),
          ],
        );

    }).toList();

    return widgets;
  }

}
