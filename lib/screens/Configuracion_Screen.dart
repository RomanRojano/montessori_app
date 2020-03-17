import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

class ConfiguracionScreen extends StatelessWidget {

  static const routeName = './configuracion';

  selectHomePageScreen(BuildContext context) {
    Navigator.of(context).pushNamed(HomePageScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
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
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(
                    ),
                    labelText: 'Clave única de padre de familia',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child:
                  RaisedButton(
                    onPressed: () => selectHomePageScreen(context),
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
}
