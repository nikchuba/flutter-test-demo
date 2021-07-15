import 'package:flutter/material.dart';
import 'package:miapp/widgets/text_input_widget.dart';
import '../app_colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  Map<String, String> errors = {};
  String login = '';
  String password = '';

  auth() async {
    var post = {
      "username": "${this.login}",
      "password": "${this.password}",
      "token": ""
    };
    var header = {'Authorization': ''};
    var uri = Uri.parse(
        'https://trello.backend.tests.nekidaem.ru/redoc/#section/Authentication/');
    var response = await http.post(
      uri,
      headers: header,
      body: post,
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  bool isValid() {
    return (this.errors.length == 0 &&
        this.login.isNotEmpty &&
        this.password.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextInputWidget(
          hintText: 'Enter your username',
          errorText: this.errors['login'],
          onInput: (val) {
            this.setState(() {
              this.login = val;
              if (val.length < 4) {
                this.errors['login'] = 'Minimum is 4 characters';
              } else {
                this.errors.remove('login');
              }
            });
          },
          isError: (this.errors['login'] ?? '').isNotEmpty,
        ),
        SizedBox(height: 15),
        TextInputWidget(
          hintText: 'Enter your password',
          errorText: this.errors['password'],
          isError: (this.errors['password'] ?? '').isNotEmpty,
          onInput: (val) {
            this.setState(() {
              this.password = val;
              if (val.length < 8) {
                this.errors['password'] = 'Minimum is 8 characters';
              } else {
                this.errors.remove('password');
              }
            });
          },
          obscure: true,
        ),
        SizedBox(height: 30),
        SizedBox(
          height: 39,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              auth();
              if (isValid()) Navigator.pushReplacementNamed(context, '/main');
            },
            child: Text('Log in', style: TextStyle(color: AppColors.grey)),
          ),
        )
      ],
    );
  }
}
