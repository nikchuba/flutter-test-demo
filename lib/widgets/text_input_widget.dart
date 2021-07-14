import 'package:flutter/material.dart';
import '../app_colors.dart';

class TextInputWidget extends StatefulWidget {
  final String hintText;
  final String errorText;
  final bool obscure;
  bool Function(String) validator;

  TextInputWidget(
      {required this.hintText,
      required this.validator,
      required this.errorText,
      this.obscure = false});

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  TextEditingController _controller = TextEditingController();
  bool _isError = false;

  @override
  initState() {
    this._controller.addListener(() {
      this.setState(() {
        this._isError = this.widget.validator(this._controller.value.text);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: this.widget.obscure,
      controller: _controller,
      textAlign: TextAlign.center,
      style: TextStyle(
        decoration: TextDecoration.none,
        color: AppColors.white,
      ),
      decoration: InputDecoration(
        isCollapsed: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightgreen),
          borderRadius: BorderRadius.circular(30),
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
        errorText: this._isError ? this.widget.errorText : null,
      ),
    );
  }
}
