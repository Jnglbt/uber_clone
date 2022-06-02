import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;

  const CustomTextField({
    Key? key,
    required this.text,
    this.textEditingController,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: text,
        contentPadding: const EdgeInsets.only(bottom: 5.0, top: 12.5),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        // focusedBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(
        //     color: Colors.white,
        //   ),
        // ),
        // enabledBorder: const UnderlineInputBorder(
        //   borderSide: BorderSide(
        //     color: Colors.white,
        //   ),
        // ),
      ),
      onChanged: onChanged,
    );
  }
}
