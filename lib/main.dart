import 'package:flutter/material.dart';
import 'package:montessori_app/screens/Configuracion_Screen.dart';
import './screens/home_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import 'package:provider/provider.dart' ;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (ctx) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ECommerce',
        theme: ThemeData (
          primarySwatch: Colors.blue,
          accentColor: Colors.grey,
          canvasColor: Colors.blue,
        ),
        //home: HomePageScreen(),
        initialRoute: HomePageScreen.routeName,
        routes: {
          HomePageScreen.routeName: (ctx) => HomePageScreen(),
          ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}