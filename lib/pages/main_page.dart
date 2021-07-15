import 'package:flutter/material.dart';
import 'package:miapp/app_colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 55,
                height: 55,
                child: ElevatedButton(
                  child: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/auth');
                  },
                ),
              ),
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'On hold'),
              Tab(text: 'In progress'),
              Tab(text: 'Needs revle'),
              Tab(text: 'Approved'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('On hold',
                  style: TextStyle(color: AppColors.lightgreen, fontSize: 50)),
            ),
            Center(
              child: Text('In progress',
                  style: TextStyle(color: AppColors.lightgreen, fontSize: 50)),
            ),
            Center(
              child: Text('Needs revle',
                  style: TextStyle(color: AppColors.lightgreen, fontSize: 50)),
            ),
            Center(
              child: Text('Approved',
                  style: TextStyle(color: AppColors.lightgreen, fontSize: 50)),
            ),
          ],
        ),
      ),
    );
  }
}
