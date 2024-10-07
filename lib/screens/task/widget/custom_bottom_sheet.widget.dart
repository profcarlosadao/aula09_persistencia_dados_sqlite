import 'package:flutter/material.dart';
import '../../../snippets.dart';

class CustomBottomSheet extends StatefulWidget {
  final Function(String) onPressed;

  const CustomBottomSheet({
    super.key,
    required this.onPressed,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text(
            'Adicionar Tarefa',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: _contentController,
              decoration: inputDecoration(label: "Informe a tarefa"),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              widget.onPressed(_contentController.text);
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}
