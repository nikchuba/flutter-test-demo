import 'package:flutter/material.dart';
import 'package:miapp/widgets/text_input_widget.dart';
import '../app_colors.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kanban'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: _AuthForm(),
      ),
    );
  }
}

class _AuthForm extends StatefulWidget {
  _AuthForm({Key? key}) : super(key: key);

  @override
  __AuthFormState createState() => __AuthFormState();
}

class __AuthFormState extends State<_AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextInputWidget(
            hintText: 'Enter your username',
            validator: (text) => text.length < 4,
            errorText: 'Minimum is 4 characters'),
        SizedBox(height: 15),
        TextInputWidget(
          hintText: 'Enter your password',
          validator: (text) => text.length < 8,
          errorText: 'Minimum is 8 characters',
          obscure: true,
        ),
        SizedBox(height: 30),
        SizedBox(
          height: 39,
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: AppColors.lightgreen,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {},
            child: Text('Log in', style: TextStyle(color: AppColors.grey)),
          ),
        )
      ],
    );
  }
}
