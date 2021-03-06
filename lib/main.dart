import 'package:flutter/material.dart';
import 'pages/auth_page.dart';
import 'app_colors.dart';
import './pages/main_page.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  dynamic data;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          primary: AppColors.lightgreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        )),
        scaffoldBackgroundColor: AppColors.black,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
              headline6: TextStyle(color: AppColors.white, fontSize: 20)),
          backgroundColor: AppColors.grey,
        ),
      ),
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => AuthPage(shareDataCards: (data) {
              this.setState(() {
                this.data = data;
              });
            }),
        '/main': (context) => MainPage(data: this.data)
      },
    );
  }
}
