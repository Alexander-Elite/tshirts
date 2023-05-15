import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget
{
  final TextEditingController controller;
  final String placeholder;
  final TextStyle style;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    required this.controller,
    required this.placeholder,
    required this.style,
    this.validator,
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: style,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: placeholder,
        hintStyle: style.copyWith(
          color: style.color?.withOpacity(.5),),
          border: _NoInputBorder(),
          focusedBorder: _NoInputBorder(),
          errorBorder: _NoInputBorder(),
          disabledBorder: _NoInputBorder(),
          enabledBorder: _NoInputBorder(),
          focusedErrorBorder: _NoInputBorder(),
      ),
    );
  }
}

class _NoInputBorder extends OutlineInputBorder
{
  @override
  BorderSide get borderSide  => const BorderSide(color: Color.fromARGB(0, 2, 2, 2));
}