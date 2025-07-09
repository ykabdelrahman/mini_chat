import 'dart:convert';
import '../../features/home/data/models/user_model.dart';
import 'prefs.dart';

class UserManager {
  Future<void> setUserData(UserModel user) async {
    var jsonData = jsonEncode(user.toJson());
    Prefs.setString('user_data', jsonData);
  }

  UserModel? getUserData() {
    var jsonData = Prefs.getString('user_data');
    if (jsonData == null) return null;
    return UserModel.fromJson(jsonDecode(jsonData));
  }

  void clearUserData() {
    Prefs.remove('user_data');
  }
}
