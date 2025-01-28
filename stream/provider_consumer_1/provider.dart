import 'dart:math';

import '../provider_consumer_1/product_in_warehouse.dart';

class Provider {
  final ProductInWarehouse _productInWarehouse;

  Provider(this._productInWarehouse);

  void produce(int products) {
    var second = Random().nextInt(4);
    Future.delayed(Duration.zero, () async {
      await Future.delayed(Duration(seconds: second));
      await _productInWarehouse.produce(products);
    });
  }
}