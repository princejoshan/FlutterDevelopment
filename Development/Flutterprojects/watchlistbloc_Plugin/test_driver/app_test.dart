import 'dart:async';

import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';

import 'steps/click_filter.dart';
import 'steps/i_see_bottomsheet.dart';
import 'steps/initia_state.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/feature/**.feature")]
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ] // you can include the "StdoutReporter()" without the message level parameter for verbose log information
    ..stepDefinitions = [
      InitialStateOfApp(),
      ISeeBottomSheet(),
      ClickFilter(),
    ]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart";
  // ..tagExpression = "@smoke" // uncomment to see an example of running scenarios based on tag expressions
  // // set to false if debugging to exit cleanly
  return GherkinRunner().execute(config);
}
