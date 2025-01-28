import 'dart:async';

class ProductInWarehouse extends Stream<int> {
  final StreamController<int> _controller = StreamController<int>.broadcast();
  static int _numberOfProduct = 0;
  final MAX_CAPACITY = 10;

  void produce(int products) {
    if (_numberOfProduct + products > MAX_CAPACITY) {
      print("Warehouse is full! Can't produce.");
      return;
    }
    _numberOfProduct += products;
    _controller.add(_numberOfProduct);
    print("numberOfProduct = $_numberOfProduct; produced: $products");
  }

  void consume(int products) {
    if (_numberOfProduct - products < 0) {
      print("Warehouse is empty! Can't consume.");
      return;
    }
    _numberOfProduct -= products;
    _controller.add(_numberOfProduct);
    print("numberOfProduct = $_numberOfProduct; consumed: $products");
  }


  @override
  StreamSubscription<int> listen(void Function(int event)? onData, {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    return _controller.stream.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError
    );
  }

  void close() {
    _controller.close();
  }

}