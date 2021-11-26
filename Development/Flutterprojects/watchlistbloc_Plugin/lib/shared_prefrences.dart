import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrences {
  // ignore: non_constant_identifier_names
  static late SharedPreferences _SharedPrefrences;

  Future<void> init() async {
    _SharedPrefrences = await SharedPreferences.getInstance();
  }

  String? get getTheme => _SharedPrefrences.getString('theme');

  set storeTheTheme(String value) {
    _SharedPrefrences.setString('theme', value);
  }
}
