import 'package:flutter/material.dart';
import 'app_colors.dart';

class TextInputWidget extends StatefulWidget {
  final String hintText;

  TextInputWidget({Key? key, required this.hintText}) : super(key: key);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  Color conditionColor = AppColors.lightgreen;
  TextEditingController _textFieldController = TextEditingController();
  bool _validate = true;

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 39,
      width: double.infinity,
      child: TextField(
        controller: _textFieldController,
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
              borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: conditionColor),
              borderRadius: BorderRadius.circular(30)),
          errorBorder: OutlineInputBorder(
            gapPadding: 60,
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: AppColors.red),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          hintText: this.widget.hintText,
          hintStyle: TextStyle(
            color: AppColors.grey,
          ),
          errorText: _validate ? 'hjh' : null,
        ),
      ),
    );
  }
}
