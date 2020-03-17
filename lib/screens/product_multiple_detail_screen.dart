//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:montessori_app/screens/products_overview_screen.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProductMultipleDetailScreen extends StatelessWidget {

  static const routeName = './product-multiple-detail';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    Widget image_carousel = new Container(
      height:  200,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          Image.network( 'https://s3.amazonaws.com/uifaces/faces/twitter/namankreative/128.jpg',
            fit: BoxFit.cover,),
          Image.network('https://s3.amazonaws.com/uifaces/faces/twitter/sasha_shestakov/128.jpg',
          fit: BoxFit.cover,),
          Image.network('https://s3.amazonaws.com/uifaces/faces/twitter/matkins/128.jpg',
          fit: BoxFit.cover,),
          Image.network('https://s3.amazonaws.com/uifaces/faces/twitter/manigm/128.jpg',
          fit: BoxFit.cover,),
          Image.network('https://s3.amazonaws.com/uifaces/faces/twitter/jay_wilburn/128.jpg',
          fit: BoxFit.cover,),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds:600),
        dotSize: 4.0,
        dotColor: Colors.blue,
        indicatorBgPadding: 4.0,
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Detalle del Aviso.'),
        ),
        body: SingleChildScrollView(
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
                  Container(
                    height: 300,
                    width: double.infinity,
                    child: image_carousel,
                  ),
                  SizedBox(height: 20),
                  Text(args.description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold ,
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
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
