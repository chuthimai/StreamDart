import 'dart:async';
import 'dart:math';

import 'product_in_warehouse.dart';

class Provider{
  late ProductInWarehouse _productInWarehouse;

  Provider(ProductInWarehouse productInWarehouse) {
    _productInWarehouse = productInWarehouse;
  }

  void produce(int products) {
    var second = Random().nextInt(4);
    Future.delayed(Duration.zero, () async {
      await Future.delayed(Duration(seconds: second));
      _productInWarehouse.produce(products);
    });
  }
}