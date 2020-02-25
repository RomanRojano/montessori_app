import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static const routeName = 'products-overview-screen';

  final List<Product> loadedProducts = [
    Product(
      id: 'd1',
      title: 'Santa Cruz',
      description: 'Descripcion de Santa Cruz',
      price: 580,
      imageUrl:
      'https://s3.amazonaws.com/uifaces/faces/twitter/namankreative/128.jpg',
    ),
    Product(
      id: 'd2',
      title: 'Santa Monica',
      description: 'Descripcion de Santa Monica',
      price: 580,
      imageUrl:
      'https://s3.amazonaws.com/uifaces/faces/twitter/sasha_shestakov/128.jpg',
    ),
    Product(
      id: 'd3',
      title: 'Santa Maria',
      description: 'Descripcion de Santa Maria',
      price: 580,
      imageUrl:
      'https://s3.amazonaws.com/uifaces/faces/twitter/matkins/128.jpg',
    ),
    Product(
      id: 'd4',
      title: 'Santa Ana',
      description: 'Descripcion de Santa Ana',
      price: 580,
      imageUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/manigm/128.jpg',
    ),
    Product(
      id: 'd5',
      title: 'Santa Patricia',
      description: 'Descripcion de Santa Patricia',
      price: 580,
      imageUrl:
      'https://s3.amazonaws.com/uifaces/faces/twitter/jay_wilburn/128.jpg',
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avisos'),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0,10.0 ,2.0 ,10.0),
          children: <Widget> [
              ProductBox(
                name: 'Aviso Num. 1',
                description: 'Descripcion Corta de Aviso Num 1',
                image:
                'https://s3.amazonaws.com/uifaces/faces/twitter/namankreative/128.jpg',
              ),
            ProductBox(
              name: 'Aviso Num. 2',
              description: 'Descripcion Corta de Aviso Num 2',
              image:
              'https://s3.amazonaws.com/uifaces/faces/twitter/sasha_shestakov/128.jpg',
            ),
            ProductBox(
              name: 'Aviso Num. 3',
              description: 'Descripcion Corta de Aviso Num 3',
              image:
              'https://s3.amazonaws.com/uifaces/faces/twitter/matkins/128.jpg',
            ),
            ProductBox(
              name: 'Aviso Num. 4',
              description: 'Descripcion Corta de Aviso Num 4',
              image:
              'https://s3.amazonaws.com/uifaces/faces/twitter/manigm/128.jpg',
            ),
            ProductBox(
              name: 'Aviso Num. 5',
              description: 'Descripcion Corta de Aviso Num 5',
              image:
              'https://s3.amazonaws.com/uifaces/faces/twitter/jay_wilburn/128.jpg',
            ),
            ProductBox(
              name: 'Aviso Num. 6',
              description: 'Descripcion Corta de Aviso Num 6',
              image:
              'https://s3.amazonaws.com/uifaces/faces/twitter/jay_wilburn/128.jpg',
            ),
          ],
          )
        );
  }

}

class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.name, this.description, this.image})
      : super(key: key);
  final String name;
  final String description;
  final String image;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.network(this.image),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(this.name, style: TextStyle(
                                  fontWeight: FontWeight.bold)),
                              Text(this.description),
                            ],
                          )
                      )
                  )
                ]
            )
        )
    );
  }


/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Shop'),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: loadedProducts.length,
          itemBuilder: (ctx, i) => ProductItem(
            loadedProducts[i].id,
            loadedProducts[i].title,
            loadedProducts[i].imageUrl,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        )
    );
  }
  */
}
