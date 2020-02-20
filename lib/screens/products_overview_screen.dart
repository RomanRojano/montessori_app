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
      imageUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/namankreative/128.jpg',
    ),
    Product(
      id: 'd2',
      title: 'Santa Monica',
      description: 'Descripcion de Santa Monica',
      price: 580,
      imageUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/sasha_shestakov/128.jpg',
    ),
    Product(
      id: 'd3',
      title: 'Santa Maria',
      description: 'Descripcion de Santa Maria',
      price: 580,
      imageUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/matkins/128.jpg',
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
      imageUrl: 'https://s3.amazonaws.com/uifaces/faces/twitter/jay_wilburn/128.jpg',
    )
  ];

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
          childAspectRatio: 3/2,
          crossAxisSpacing:  10,
          mainAxisSpacing: 10,
        ),
      )
    );
  }
}

/*
 */
