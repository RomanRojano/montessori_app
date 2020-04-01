//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:montessori_app/screens/products_overview_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductMultipleDetailScreen extends StatelessWidget {

  static const routeName = './product-multiple-detail';
  CarouselSlider carouselSlider;

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

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
                  SizedBox(height: 10),
                  Container(
                    height: 300,
                    width: double.infinity,
                    child: carouselSlider =  new CarouselSlider(
                      items: [
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
                      autoPlay: true,
                      reverse: false,
                      height: 300.0,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      autoPlayInterval: Duration(seconds: 2) ,
                      autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      pauseAutoPlayOnTouch: Duration(seconds: 5),
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox.fromSize(
                        size: Size(35, 25), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.white, // button color
                            child: InkWell(
                              splashColor: Colors.indigo, // splash color
                              onTap: goToPrevious, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.keyboard_arrow_left), // icon
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      SizedBox.fromSize(
                        size: Size(35, 25), // button width and height
                        child: ClipOval(
                          child: Material(
                            color: Colors.white, // button color
                            child: InkWell(
                              splashColor: Colors.indigo, // splash color
                              onTap: goToNext, // button pressed
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.keyboard_arrow_right), // icon
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
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

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
