import 'package:flutter/material.dart';
import '../screens/products_overview_screen.dart';
import '../screens/Configuracion_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key key, this.title}) : super(key: key);

  final String title;
  static const routeName = 'home-screen';

  @override
  _HomePageScreen createState() => _HomePageScreen();
}

 class _HomePageScreen extends State<HomePageScreen> {
   String uuid = '';
   String nombre = '';
   Map data ;
   List usersData;

   selectProductsOverview(BuildContext context) {
     Navigator.of(context).pushNamed(ProductsOverviewScreen.routeName);
   }
   selectConfiguracionScreen(BuildContext context) {
     Navigator.of(context).pushNamed(ConfiguracionScreen.routeName);
   }
   selectHomePageScreen(BuildContext context) {
     Navigator.of(context).pushNamed(HomePageScreen.routeName);
   }

   @override
   void initState() {
     super.initState();
     _inicializa();
   }

   Future _inicializa() async {
     String uuid = await obtenerpreferencias();
     this.uuid = uuid ;
     if (uuid != 'SIN UUID'){
       String nombre = await obtenerNombre(uuid);
       this.nombre = nombre;
     }else{
       nombre = 'SIN REGISTRO';
     }
   }

   Future<String> obtenerpreferencias() async {
     final preferences= await SharedPreferences.getInstance();
     final uuid_g = preferences.getString('uuid');
     if (uuid_g == null){
       return 'SIN UUID';
     }
     return uuid_g;
   }

   Future<String> obtenerNombre(String uuid_in) async {
     http.Response response =  await http.get(
         Uri.encodeFull('http://192.168.20.10:8000/api/montessori/usuario/$uuid_in'),
         headers: {
           "Accept": "application/json"
         }
     );
     if (response.statusCode == 200){
       data = jsonDecode(response.body);
       setState(() {
         usersData = data['recordset']['recordset'];
       });
       return usersData[0]["nombre"].trim();
     } else {
       return '';
     }
   }

   @override
   Widget build(BuildContext context) {

     return Scaffold(
      appBar: AppBar(
        title: Text('Colégio Montessori de Chihuahua.'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/fondo_cmdch_2.jpg"),
            fit:BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text('Siempre en Contacto entre Nosotros.',
                  textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.yellow,
                )
              ),
              const SizedBox(height: 60),
              RaisedButton(
                onPressed: () => selectProductsOverview(context),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                      ' Avisos ',
                      style: TextStyle(fontSize: 20)
                  ),
                ),
              ),
              const SizedBox(height: 120),
              Text('$nombre',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => selectConfiguracionScreen(context),
        tooltip: 'Configuración',
        child: Icon(Icons.settings),
        backgroundColor: uuid == 'SIN REGISTRO' ? Colors.red :Colors.lightBlue
      ),
    );
  }

}


