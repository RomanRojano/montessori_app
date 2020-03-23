import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracionScreen extends StatelessWidget {

  static const routeName = './configuracion';
  
  final uuidController =TextEditingController(text:"");
  static String uuidguardado = '';


  selectHomePageScreen(BuildContext context) {
    Navigator.of(context).pushNamed(HomePageScreen.routeName);
  }

  
  @override
  Widget build(BuildContext context) {
  
    obtenerpreferencias();

    return Scaffold(
      appBar: AppBar(
        title: Text('Identificación de la Familia.'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Código de padre de familia recibido por correo.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white
              ),
            ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  obscureText: false,
                  style: TextStyle(fontSize: 14),
                  controller: uuidController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(),
                    labelText: uuidguardado == 'SIN REGISTRO' ? 'Clave única de padre de familia' : '$uuidguardado',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child:
                  RaisedButton(
                    onPressed: () {
                      uuidGuardar() ;
                      //selectHomePageScreen(context),
                    },
                    child: Text('Ragistrame'),
                    color: Colors.white,
                  ),
              ),
          ],
          ),
        ),
      ),
    );
  }

 Future obtenerpreferencias() async {
    SharedPreferences preferences= await SharedPreferences.getInstance();
    uuidguardado = preferences.getString('uuid') ?? 'SIN REGISTRO' ;
    uuidController.text = uuidguardado ;
  }
  uuidGuardar() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString("uuid", uuidController.text);
  }

}
