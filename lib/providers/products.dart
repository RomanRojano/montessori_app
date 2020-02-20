import 'package:flutter/material.dart';
import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
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
    ),
  ];

  List<Product> get items {
    return [... items];
  }

  void addProduct(){
    notifyListeners();
  }
}