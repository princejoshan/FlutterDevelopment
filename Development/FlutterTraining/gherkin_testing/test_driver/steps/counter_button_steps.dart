import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

class UserIsInDashboardStep extends Given {
  @override
  Future<void> executeStep() async {
    // ignore: avoid_print
    print('executing UserIsInDashboardStep..');
    // implement your code
  }

  @override
  RegExp get pattern => RegExp(r"the user is at the counter dashboard");
}
