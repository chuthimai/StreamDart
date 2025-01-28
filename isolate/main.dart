import 'dart:async';

import 'worker.dart';

void main() async {
  final worker = await Worker.spawn();
  print(await worker.parseJson('{"key":"value"}'));
  print(await worker.parseJson('"banana"'));
  print(await worker.parseJson('[true, false, null, 1, "string"]'));
  print(
      await Future.wait([worker.parseJson('"yes"'), worker.parseJson('"no"')]));
  worker.close();
}

