import 'package:flutter/material.dart';



class InputPage extends StatefulWidget {
@override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  
  String _nombre = '';
  String _email = '';
  String _fecha = '';

  String _opcionSelecionada = 'volar';
  List<String> _poderes = ['volar', 'super fuerza', 'aliento congelante', 'rayos X'];

  TextEditingController _inputFieldDateController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Inputs de Texto')
       ),
       body: ListView(
         padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
         children: <Widget>[
           _crearInput(),
           Divider(),
           _crearEmail(),
           Divider(),
           _crearPersona(),
           Divider(),
           _crearPassword(),
           Divider(),
           _crearFecha(context),
           Divider(),
           _crearDropdown(),
         ]
       ),
    );
  }

  Widget _crearInput() {

    return TextField(
      autofocus: false, //Hace que abra el teclado al entrar a esa página
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Pon el nombre completo',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;  
        });
      },
    );

  }

  Widget _crearEmail(){

    return TextField(
      
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        hintText: 'Dirección de correo',
        labelText: 'Email',
        helperText: 'Escribe tu correo electrónico',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor) => setState(() {
          _email = valor;  
        })
      
    );
  }

  Widget _crearPassword(){

    return TextField(
      
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        hintText: 'Contraseña',
        labelText: 'Password',
        helperText: 'Escribe tu contraseña',
        suffixIcon: Icon(Icons.remove_red_eye),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor) => setState(() {
          _email = valor;  
        })
      
    );
  }

  Widget _crearFecha(BuildContext context){

    return TextField(
      
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha nacimiento',
        helperText: 'Escribe tu fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.perm_contact_calendar)
      ),
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode()); 
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async{

    DateTime picked = await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(1900), 
      lastDate: new DateTime(2030),
      locale: Locale('es', 'ES')
    );

    if(picked != null){
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }

  }

  Widget _crearPersona(){
    
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Correo es: $_email'),
      trailing: Text('Poder: $_opcionSelecionada'),
    );
  }

  List <DropdownMenuItem<String>> getOpcionesDropdown(){

    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach( (poder) {
    
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder
      ) 
      );
    });
    return lista;
  }
  
  Widget _crearDropdown(){

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 25.0),
        DropdownButton(
          value: _opcionSelecionada,
          items: getOpcionesDropdown(),
          onChanged: (opt){
          setState(() {
            _opcionSelecionada = opt;
          });
          }
        )
      ]
    );
    
    

  }

}