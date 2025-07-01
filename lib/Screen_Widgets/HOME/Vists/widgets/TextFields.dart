import 'package:flutter/material.dart';




class Textfields extends StatelessWidget {
  final String Name;
  final TextEditingController controller;

  const Textfields({
    super.key,
    required this.Name,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$Name :', style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(width: 10),
        Expanded(
          child: TextFormField(controller: controller),
        ),
      ],
    );
  }
}

