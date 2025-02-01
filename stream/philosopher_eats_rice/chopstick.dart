import 'dart:async';

class Chopstick extends Stream<bool>{
  final StreamController<bool> _controller = StreamController();
  StreamSubscription<bool>? _subscription;
  final String _name;

  Chopstick(this._name) {
    _controller.add(true);
  }

  String get name => _name;

  @override
  StreamSubscription<bool> listen(void Function(bool event)? onData, {Function? onError, void Function()? onDone, bool? cancelOnError}) {

    _subscription = _controller.stream.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError
    );

    return _subscription!;
  }

  void pause() {
    _subscription!.pause();
  }

  void resume() {
    _subscription!.resume();
  }

  void close() {
    _controller.close();
  }

  bool isClose() =>  _controller.isClosed;

  bool isPause() => _controller.isPaused;

  bool hasListener() => _controller.hasListener;
}