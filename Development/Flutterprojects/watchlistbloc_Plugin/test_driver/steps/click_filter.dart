import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';

import '../pages/homepage.dart';

class ClickFilter extends AndWithWorld<FlutterWorld> {
  ClickFilter()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    HomePage homePage = HomePage(world.driver ?? await FlutterDriver.connect());
    await homePage.clickFilterIcon();
  }

  @override
  RegExp get pattern => RegExp(r"I click the filterIcon button");
}
