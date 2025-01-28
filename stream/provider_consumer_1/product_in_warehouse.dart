import 'dart:async';

class ProductInWarehouse {
  final StreamController<int> _controller = StreamController();
  static int _numberOfProduct = 0;
  final MAX_CAPACITY = 10;

  Future<void> produce(int products) async {
    if (_numberOfProduct + products > MAX_CAPACITY) {
      print("Warehouse is full! Can't produce.");
      return;
    }
    _numberOfProduct += products;
    _controller.add(_numberOfProduct);
    print("numberOfProduct = $_numberOfProduct; produced: $products");
  }

  Future<void> consume(int products) async {
    if (_numberOfProduct - products < 0) {
      print("Warehouse is empty! Can't consume.");
      return;
    }
    _numberOfProduct -= products;
    _controller.add(_numberOfProduct);
    print("numberOfProduct = $_numberOfProduct; consumed: $products");
  }

  Stream<int> get stream => _controller.stream;

  void close() => _controller.close();
}