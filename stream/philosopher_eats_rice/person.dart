import 'dart:math';

import 'chopstick.dart';

class Person {
  final String _name;
  bool _isDone = false;

  Person(this._name);

  Future<void> eat(Chopstick chopstick1, Chopstick chopstick2) async {
    if (_isDone) return;
    bool isGotChopsticks = getChopsticks(chopstick1, chopstick2);
    while (!isGotChopsticks) {
      await Future.delayed(Duration(seconds: 5), () {
        isGotChopsticks = getChopsticks(chopstick1, chopstick2);
      });
    }

    await Future.delayed(Duration(seconds: Random().nextInt(3) + 5));
    chopstick1.pause();
    chopstick2.pause();
    _isDone = true;
    print(this);
  }

  bool getChopsticks(Chopstick chopstick1, Chopstick chopstick2) {
    bool isGotChopstick1 = getChopstick(chopstick1);
    bool isGotChopstick2 = getChopstick(chopstick2);
    if (isGotChopstick1 && isGotChopstick2) return true;
    chopstick1.pause();
    chopstick2.pause();
    return false;
  }

  bool getChopstick(Chopstick chopstick) {
    if (!chopstick.hasListener() || chopstick.isPause()) {
      try {
        chopstick.listen((event) {
          print("$_name gets chopstick1 ${chopstick.name} successful.");
        });
      } catch (e) {
        chopstick.resume();
        print("$_name gets chopstick1 ${chopstick.name} successful.");
      }
    } else {
      print("$_name can't get ${chopstick.name}");
      return false;
    }

    return true;
  }

  @override
  String toString() {
    return _name + ": " + _isDone.toString();
  }
}