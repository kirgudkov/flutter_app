import 'model/User.dart';

class Repository {
  static Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 3));
    return User(name: 'Кирилл', surname: 'Иблан');
  }
}