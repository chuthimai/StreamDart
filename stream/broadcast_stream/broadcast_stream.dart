import 'dart:async';
import 'dart:math';


void main() {
  var broadcastStream1 = BroadcastNumberStream();
  var broadcastStream2 = BroadcastNumberStream();

  broadcastStream1.listen((value) => print("Listener 1 from stream 1: $value"));
  broadcastStream1.listen((value) => print("Listener 2 from stream 1: $value"));
  broadcastStream2.listen((value) => print("Listener 1 from stream 2: $value"));
}

class BroadcastNumberStream extends Stream<int> {
  // Tạo broadcast stream
  final StreamController<int> _controller = StreamController<int>.broadcast();

  BroadcastNumberStream() {
    _emitNumbers();
  }

  void _emitNumbers() async {
    var millisecond = Random().nextInt(7);
    for (int i = 1; i <= 3; i++) {
      await Future.delayed(Duration(milliseconds: millisecond));
      _controller.add(millisecond);
    }
    _controller.close();
  }

  @override
  StreamSubscription<int> listen(
      void Function(int)? onData, {
        Function? onError,
        void Function()? onDone,
        bool? cancelOnError,
      }) {
    return _controller.stream.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }
}


