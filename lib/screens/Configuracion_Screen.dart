import 'package:flutter/material.dart';

class ConfiguracionScreen extends StatelessWidget {

  static const routeName = './product-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuracion'),
      ),
      body: Center(
        child: Text('Identificador'),
      ),
    );
  }
}
