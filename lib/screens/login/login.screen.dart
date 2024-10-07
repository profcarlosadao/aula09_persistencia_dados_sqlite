import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../register/register.screen.dart';
import '../task/task.screen.dart';
import 'login.controller.dart';
import '../../snippets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late LoginController _loginController;
  final List<void Function()> _disposers = [];

  @override
  void initState() {
    _loginController = LoginController();
    _listener();
    super.initState();
  }

  _listener() {
    _disposers.add(ever(_loginController.message, (String? value) {
      if (value != null) {
        snackBar(context, value);
        _loginController.message.value = null;
      }
    }).call);
    _disposers.add(ever(_loginController.logged, (bool? value) {
      if (value != null) {
        snackBar(context, "Login realizado com sucesso!!");
        openRoute(context, const TaskScreen());
        _loginController.logged.value = null;
      }
    }).call);
  }

  _onPressed() {
    _loginController.verifyLogin(
      _emailController.text,
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "Login",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _emailController,
              decoration: inputDecoration(label: "Informe o e-mail"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 20,
            ),
            child: TextFormField(
              controller: _passwordController,
              decoration: inputDecoration(label: "Informe password"),
            ),
          ),
          ElevatedButton(onPressed: _onPressed, child: const Text("Entrar")),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Não tem conta? "),
                InkWell(
                  onTap: () {
                    openRoute(context, const RegisterScreen());
                  },
                  child: const Text(
                    "Cadastro",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
