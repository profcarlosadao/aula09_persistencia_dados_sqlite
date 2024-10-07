import 'package:flutter/material.dart';

final TextEditingController controller = TextEditingController();

OutlineInputBorder border({Color borderColor = Colors.black}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: borderColor, width: 1),
    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
  );
}

const spaceHeight = SizedBox(height: 10);

const spaceWidth = SizedBox(height: 10);

Widget icon({required IconData icon, required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Icon(icon, color: Colors.black),
  );
}

InputDecoration inputDecoration({required String label}) => InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
  labelText: label,
  floatingLabelBehavior: FloatingLabelBehavior.always,
  labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
  focusedBorder: border(borderColor: Colors.black),
  enabledBorder: border(borderColor: Colors.black),
  disabledBorder: border(borderColor: Colors.grey),
  errorBorder: border(borderColor: Colors.red),
  focusedErrorBorder: border(borderColor: Colors.red),
  counterText: '',
);

openRoute(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

closeRoute(BuildContext context) {
  Navigator.pop(context);
}

void snackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}