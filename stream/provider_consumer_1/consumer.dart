import 'dart:math';

import '../provider_consumer_1/product_in_warehouse.dart';

class Consumer {
  final ProductInWarehouse _productInWarehouse;

  Consumer(this._productInWarehouse);

  void consume(int products) {
    var second = Random().nextInt(4);
    Future.delayed(Duration.zero, () async {
      await Future.delayed(Duration(seconds: second));
      await _productInWarehouse.consume(products);
    });
  }
}