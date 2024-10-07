import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../snippets.dart';
import '../task/task.screen.dart';
import 'register.controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late RegisterController _registerController;
  final List<void Function()> _disposers = [];

  @override
  void initState() {
    _registerController = RegisterController();
    _listener();
    super.initState();
  }

  _listener() {
    _disposers.add(ever(_registerController.message, (String? value) {
      if (value != null) {
        snackBar(context, value);
        _registerController.message.value = null;
      }
    }).call);
    _disposers.add(ever(_registerController.registered, (bool? value) {
      if (value != null) {
        snackBar(context, "Usuário cadastrado com sucesso!!!");
        _registerController.registered.value = null;
        openRoute(context, const TaskScreen());
      }
    }).call);
  }

  _onPressed() {
    _registerController.save(
      _nameController.text,
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
              "Cadastro",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _nameController,
              decoration: inputDecoration(label: "Informe o nome"),
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
          ElevatedButton(onPressed: _onPressed, child: const Text("Salvar")),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Jé tem conta? "),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Login",
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
