import 'package:flutter/material.dart';

enum Auth1 {
  signin,
  signup,
}

class CustomRadio extends StatelessWidget {
  final Auth1 value;
  final Auth1? groupValue;
  final Color? color1;
  final String text;
  final ValueChanged onChanged;

  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.text,
    required this.onChanged,
    required this.color1,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: color1,
      title: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: Radio(
        activeColor: const Color.fromARGB(255, 71, 24, 212),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
