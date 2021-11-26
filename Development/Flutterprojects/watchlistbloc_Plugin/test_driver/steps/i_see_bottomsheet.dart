import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';

class ISeeBottomSheet extends Then1WithWorld<String, FlutterWorld> {
  ISeeBottomSheet()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 10));

  @override
  Future<void> executeStep(String value) async {
    // HomePage homePage = HomePage(world.driver ?? await FlutterDriver.connect());
    await world.driver?.waitFor(find.text(value));
  }

  @override
  RegExp get pattern => RegExp(r"I see if the value {string} exists");
}
