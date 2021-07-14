import 'package:flutter/material.dart';
import 'auth_page.dart';
import 'app_colors.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.black,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
              headline6: TextStyle(color: AppColors.white, fontSize: 20)),
          backgroundColor: AppColors.grey,
        ),
      ),
      home: AuthPage(),
    );
  }
}
