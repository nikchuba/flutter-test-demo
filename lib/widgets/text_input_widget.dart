import 'package:flutter/material.dart';
import '../app_colors.dart';

class TextInputWidget extends StatefulWidget {
  final TextEditingController controller = TextEditingController(text: '');
  final String hintText;
  final String? errorText;
  final bool obscure;
  final bool? isError;
  final Function(String)? onInput;

  TextInputWidget(
      {required this.hintText,
      this.isError,
      this.onInput,
      this.errorText,
      this.obscure = false});

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  TextEditingController? controller;

  @override
  initState() {
    this.controller = this.widget.controller;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: this.widget.obscure,
      controller: this.controller,
      onChanged: (value) {
        print(value);
        this.widget.onInput!(value);
      },
      textAlign: TextAlign.center,
      style: TextStyle(
        decoration: TextDecoration.none,
        color: AppColors.white,
      ),
      decoration: InputDecoration(
        isCollapsed: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.lightgreen),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.red),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        hintText: this.widget.hintText,
        hintStyle: TextStyle(
          color: AppColors.grey,
        ),
        errorText: this.widget.isError! ? this.widget.errorText : null,
      ),
    );
  }
}
