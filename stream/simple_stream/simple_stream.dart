import 'dart:async';
import 'dart:math';

void main() {
  Stream<int> stream1 = PrintCountNumberStream();
  Stream<int> stream2 = PrintCountNumberStream();
  Stream<int> stream3 = PrintCountNumberStream();
  stream1.listen((event) {print("Stream1: $event");});
  stream2.listen((event) {print("Stream2: $event");});
  stream3.listen((event) {print("Stream3: $event");});
}


class PrintCountNumberStream extends Stream<int> {
  StreamController<int> _controller = StreamController();

  @override
  StreamSubscription<int> listen(void Function(int event)? onData, {Function? onError, void Function()? onDone, bool? cancelOnError}) {
      var second = Random().nextInt(4);
      Future.delayed(Duration.zero, () async {
        for (int i = 1; i <= 5; i++) {
          await Future.delayed(Duration(seconds: second));
          if (onData != null) onData(second);
        }
      });
      _controller.close();
      return _controller.stream.listen(
        onData,
        onError: onError,
        onDone: onDone,
        cancelOnError: cancelOnError,
      );
  }
}

