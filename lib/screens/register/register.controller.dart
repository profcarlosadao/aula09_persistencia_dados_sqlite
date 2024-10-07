import 'package:get/get.dart';
import '../../datasource/task.datasource.dart';

class RegisterController extends GetxController {
  final Rx<String?> message = Rx(null);
  final Rx<bool?> registered = Rx(null);
  late TaskDataSource _dataSource;

  RegisterController() {
    _dataSource = TaskDataSource();
    _initController();
  }

  _initController() async {
    await _dataSource.initPreference();
  }

  save(String name, String email, String password){
    bool isValid = true;

    if (name.isEmpty) {
      message.value = "Informe o nome";
      isValid = false;
    }

    if (email.isEmpty) {
      message.value = "Informe o e-mail";
      isValid = false;
    }

    if (password.isEmpty) {
      message.value = "Informe o password";
      isValid = false;
    }

    if (isValid) {
      _dataSource.save("name", name);
      _dataSource.save("email", email);
      _dataSource.save("password", password);
       registered.value = true;
    }
  }
}
