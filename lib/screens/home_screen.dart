import 'package:flutter/material.dart';
import '../screens/products_overview_screen.dart';
import '../screens/Configuracion_Screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageScreen extends StatelessWidget {

  static const routeName = 'home-screen' ;
  //final uuidController =TextEditingController(text:"");
  static String uuidguardado = '';
  
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
  Widget build(BuildContext context) {

    obtenerpreferencias();

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
              Text('$uuidguardado',
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
        backgroundColor: uuidguardado == 'SIN REGISTRO' ? Colors.red :Colors.lightBlue
      ),
    );
  }

  Future obtenerpreferencias() async {
    SharedPreferences preferences= await SharedPreferences.getInstance();
    uuidguardado = preferences.getString('uuid') ?? 'SIN REGISTRO' ;
  }

}


