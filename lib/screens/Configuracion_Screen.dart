import 'package:flutter/material.dart';

class ConfiguracionScreen extends StatelessWidget {

  static const routeName = './configuracion';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Identificación de la Familia.'),
      ),
      body: Center(
        child: Text('Ud. ha recibido un codigo por correo electrónico que lo identifica como familia del colegio.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}
