import 'dart:async';
import 'dart:math';

import 'product_in_warehouse.dart';

class Consumer {
  late ProductInWarehouse _productInWarehouse;

  Consumer(ProductInWarehouse productInWarehouse) {
    _productInWarehouse = productInWarehouse;
  }

  void consume(int products) {
    var second = Random().nextInt(4);
    Future.delayed(Duration.zero, () async {
      await Future.delayed(Duration(seconds: second));
      _productInWarehouse.consume(products);
    });
  }

}