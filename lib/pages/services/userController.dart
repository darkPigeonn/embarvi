import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  String name = 'Joko';
  getName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final name2 = sharedPreferences.get('name');
    print(name2);
    return name2;
  }

  setName(String insertName) {
    name = insertName;
  }
}

saveData(String name) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  print(name);
  sharedPreferences.setString('name', name);
}
