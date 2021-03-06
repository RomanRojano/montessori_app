import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail_screen.dart';
import '../screens/product_multiple_detail_screen.dart';
import '../screens/product_Map_detail.dart';


enum FilterOptions {
  SinLeer,
  Todo,
}

 class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = 'products-overview-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avisos'),
          actions: <Widget>[
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(child: Text('No Leídos'), value: 0),
                PopupMenuItem(child: Text('Todos'), value: 1),
              ],
            ),
          ],
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            ProductBox(
              name: 'Campeones Liga Municipal',
              description: 'Abejitas gana la liga municipal 2019.',
              image:
                  //'http://tisdc.ddns.net:8000/static/montessori/img01.jpg',
                  'https://s3.amazonaws.com/uifaces/faces/twitter/namankreative/128.jpg',
              id: 1,
              multiple: true,
            ),
            ProductBox(
              name: 'Majalca en Seattle',
              description: 'Destacada participacion de docentes en Seattle WA.',
              image:
                  //'http://tisdc.ddns.net:8000/static/montessori/img02.jpg',
                  'https://s3.amazonaws.com/uifaces/faces/twitter/sasha_shestakov/128.jpg',
              id: 2,
              multiple: false,
            ),
            ProductBox(
              name: 'Conferencia Magna.',
              description: 'Habilidades de resilencia en la familia.',
              image:
                  //'http://tisdc.ddns.net:8000/static/montessori/img03.jpg',
                  'https://s3.amazonaws.com/uifaces/faces/twitter/matkins/128.jpg',
              id: 3,
              multiple: false,
            ),
            ProductBox(
              name: 'Pláticas Matutinas.',
              description: 'Lo que deberias saber sobre tu hijo.',
              image:
                //'http://tisdc.ddns.net:8000/static/montessori/img04.png',
                  'https://s3.amazonaws.com/uifaces/faces/twitter/manigm/128.jpg',
              id: 4,
              multiple: false,
            ),
            ProductBox(
              name: 'Convocatoria Deportiva.',
              description: 'Invitación a integrar un equipo de soccer femenil.',
              image:
              //'http://tisdc.ddns.net:8000/static/montessori/img05.jpg',
                  'https://s3.amazonaws.com/uifaces/faces/twitter/jay_wilburn/128.jpg',
              id: 5,
              multiple: false,
            ),
            ProductBox(
              name: 'Inicio de campaña.',
              description: 'Campaña nacional de reforestación.',
              image:
                  //'http://tisdc.ddns.net:8000/static/montessori/img06.jpg',
                  'https://s3.amazonaws.com/uifaces/faces/twitter/jay_wilburn/128.jpg',
              id: 6,
              multiple: false,
            ),
          ],
        ));
  }
}

class ReadBox extends StatefulWidget {
  @override
  _ReadBoxState createState() => _ReadBoxState();
}

class _ReadBoxState extends State<ReadBox> {
  bool _read = false;

  void _setRead() {
    setState(() {
      _read = true;
    });
  }

  Widget build(BuildContext context) {
    double _size = 20;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_read
                ? Icon(
                    Icons.done,
                    size: _size,
                  )
                : Icon(
                    Icons.done_outline,
                    size: _size,
                  )),
            color: Colors.red[500],
            onPressed: _setRead,
            iconSize: _size,
          ),
        ),
      ],
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key key, this.name, this.description, this.image, this.id, this.multiple })
      : super(key: key);

  final String name;
  final String description;
  final String image;
  final int id;
  final bool multiple;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: GestureDetector(
                onTap: () {
                  if (this.multiple) {
                    Navigator.of(context).pushNamed(
                        ProductMultipleDetailScreen.routeName,
                        arguments: ScreenArguments(
                          this.name,
                          this.description,
                          'Esta es una descripcion de multiple muy larga que tiene varios renglones y que tiene toda la informacion a detalle de lo que se debe de informar',
                          this.image,
                        ));
                  }
                  else {
                    Navigator.of(context).pushNamed(
                        ProductDetailScreen.routeName,
                        arguments: ScreenArguments(
                          this.name,
                          this.description,
                          'Esta es una descripcion muy larga que tiene varios renglones y que tiene toda la informacion a detalle de lo que se debe de informar',
                          this.image,
                        ));
                  };
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.network(this.image),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text(this.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(this.description),
                                  ReadBox(),
                                ],
                              )))
                    ]))));
  }

}
  class ScreenArguments {
    final String name;
    final String description;
    final String longDesc;
    final String image;

    ScreenArguments(this.name, this.description,this.longDesc, this.image);
  }

