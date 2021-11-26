import 'package:flutter_driver/flutter_driver.dart';

class HomePage {
  late FlutterDriver _flutterDriver;

  HomePage(FlutterDriver flutterDriver) {
    _flutterDriver = flutterDriver;
  }

  final filterIcon = find.byValueKey('sorting');

  Future<void> clickFilterIcon() async {
    return await _flutterDriver.tap(filterIcon);
  }
}
