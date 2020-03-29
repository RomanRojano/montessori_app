import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ConfiguracionScreen extends StatefulWidget {
  ConfiguracionScreen({Key key}) : super(key: key);

  static const routeName = './configuracion';

  @override
  _ConfiguracionScreen createState() => _ConfiguracionScreen();
}

class _ConfiguracionScreen extends State<ConfiguracionScreen> {
  String uuid = '';
  String nombre = '';
  Map data ;
  List usersData;
  final uuidController =TextEditingController(text:"");

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
    uuidController.text = uuid;
    if (uuid != 'SIN UUID'){
      String nombre = await obtenerNombre(uuid);
      this.nombre = nombre;
    }else{
      nombre = '';
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

  Future guardaUUID() async{
    final preferences = await SharedPreferences.getInstance();

    preferences.setString('uuid',uuidController.text);
    _inicializa();
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
              Text(nombre=='' ? 'SIN REGISTRO' : 'REGISTRADO A NOMBRE DE $nombre' ,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white
                ),
              ),
              const SizedBox(height: 80),
              Text('Código de padre de familia recibido por correo.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
              ),
            ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  obscureText: false,
                  style: TextStyle(fontSize: 10),
                  controller: uuidController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Colors.white),
                    ),
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(),
                    labelText: 'Clave única' ,
                    labelStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child:
                  RaisedButton(
                    onPressed: () => guardaUUID() ,
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
