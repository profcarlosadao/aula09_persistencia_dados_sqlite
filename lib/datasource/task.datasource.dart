import 'package:shared_preferences/shared_preferences.dart';

class TaskDataSource {
  late SharedPreferences _preference;

  initPreference() async {
    _preference = await SharedPreferences.getInstance();
  }

  String? load(String key) {
    return _preference.getString(key);
  }

  save(String key, String value){
    _preference.setString(key, value);
  }
}