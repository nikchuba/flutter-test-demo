import 'package:flutter/material.dart';
import 'package:miapp/widgets/text_input_widget.dart';
import '../app_colors.dart';
import 'package:dio/dio.dart';

class AuthPage extends StatefulWidget {
  final dynamic Function(dynamic) shareDataCards;
  AuthPage({required this.shareDataCards});
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
        child: _AuthForm(shareDataCards: (data) {
          this.setState(() {
            this.widget.shareDataCards(data);
          });
        }),
      ),
    );
  }
}

class _AuthForm extends StatefulWidget {
  final dynamic Function(dynamic) shareDataCards;
  _AuthForm({required this.shareDataCards});

  @override
  __AuthFormState createState() => __AuthFormState();
}

class __AuthFormState extends State<_AuthForm> {
  Map<String, String> errors = {};
  String login = '';
  String password = '';

  Map<String, dynamic> serverError = {'status': '', 'msg': ''};

  bool isValid() {
    return (this.errors.length == 0 &&
        this.login.isNotEmpty &&
        this.password.isNotEmpty);
  }

  void getCards(String token) async {
    String url = 'https://trello.backend.tests.nekidaem.ru/api/v1/cards/';
    Map<String, String> header = {'Authorization': 'JWT $token'};
    try {
      Response response = await Dio().get(
        url,
        options: Options(headers: header),
      );
      if (this.mounted) {
        this.setState(() {
          this.widget.shareDataCards(response.data);
        });
      }
      print(response.data);
    } on DioError catch (e) {
      this.setState(() {
        this.widget.shareDataCards(e.response?.data);
      });
    }
  }

  Future<bool> auth() async {
    Map<String, String> body = {
      "username": this.login,
      "password": this.password
    };
    String url = 'https://trello.backend.tests.nekidaem.ru/api/v1/users/login/';
    try {
      Response response = await Dio().post(url, data: body);
      String token = response.data['token'];
      this.getCards(token);
      return true;
    } on DioError catch (e) {
      if (e.response != null) {
        var errMsg = e.response?.data['non_field_errors'][0];
        setState(() {
          this.serverError['status'] = e.error;
          this.serverError['msg'] = errMsg;
        });
      } else {
        setState(() {
          this.serverError['status'] = e.error;
          this.serverError['msg'] = e.message;
        });
      }
      return false;
    }
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
            style: ElevatedButton.styleFrom(onSurface: AppColors.lightgreen),
            onPressed: isValid()
                ? () async {
                    if (await auth())
                      Navigator.pushReplacementNamed(context, '/main');
                  }
                : null,
            child: Text('Log in', style: TextStyle(color: AppColors.grey)),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        if (serverError['msg'] != '')
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${serverError["status"]}',
                style: TextStyle(color: AppColors.red, fontSize: 14),
              ),
              SizedBox(height: 10),
              Text(
                'Error message: ${serverError["msg"]}',
                style: TextStyle(color: AppColors.red, fontSize: 14),
              ),
            ],
          ),
      ],
    );
  }
}
