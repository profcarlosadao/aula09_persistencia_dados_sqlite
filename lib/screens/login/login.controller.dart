import 'package:get/get.dart';
import '../../datasource/task.datasource.dart';

class LoginController extends GetxController {
  final Rx<String> _email = Rx("");
  final Rx<String> _password = Rx("");
  final Rx<String?> message = Rx(null);
  final Rx<bool?> logged = Rx(null);
  late TaskDataSource _dataSource;

  LoginController() {
    _dataSource = TaskDataSource();
    initController();
  }

  String get email => _email.value;

  String get password => _password.value;

  initController() async {
    await _dataSource.initPreference();
  }

  verifyLogin(String email, String password) {
    bool isValid = true;

    if (email.isEmpty) {
      message.value = "Informe o e-mail";
      isValid = false;
    }

    if (password.isEmpty) {
      message.value = "Informe o password";
      isValid = false;
    }

    if (isValid) {
      bool success = true;
      final rEmail = _dataSource.load("email");
      final rPassword = _dataSource.load("password");

      if (rEmail == null && rPassword == null) {
        message.value = "Usuário não encontrado";
        logged.value = false;
      } else {
        if (rEmail != email) {
          message.value = "O e-mail informado está incorreto!";
          success = false;
        }

        if (rPassword == null || rPassword != password) {
          message.value = "A senha informada está incorreta!";
          success = false;
        }
        logged.value = success;
      }
    }
  }
}
