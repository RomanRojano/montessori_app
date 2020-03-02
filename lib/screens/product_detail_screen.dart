//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:montessori_app/screens/products_overview_screen.dart';

class ProductDetailScreen extends StatelessWidget {

  static const routeName = './product-detail';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Detalle del Aviso.'),
        ),
        body: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(args.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold ,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Image.network(args.image),
                  SizedBox(height: 20),
                  Text(args.description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold ,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(args.longDesc,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            )
        )
    );
  }
}
