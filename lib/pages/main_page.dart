import 'package:flutter/material.dart';
import 'package:miapp/app_colors.dart';

class MainPage extends StatefulWidget {
  final dynamic data;
  MainPage({Key? key, required this.data}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  dynamic data;
  @override
  void initState() {
    this.data = this.widget.data;
    super.initState();
  }

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
                    print(this.widget.data);
                  },
                ),
              ),
            ],
          ),
          bottom: TabBar(
            indicatorColor: AppColors.lightgreen,
            tabs: [
              Tab(text: 'On hold'),
              Tab(text: 'In progress'),
              Tab(text: 'Needs review'),
              Tab(text: 'Approved'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('${this.data}',
                  style: TextStyle(color: AppColors.lightgreen, fontSize: 50)),
            ),
            Center(
              child: Text('In progress',
                  style: TextStyle(color: AppColors.lightgreen, fontSize: 50)),
            ),
            Center(
              child: Text('Needs review',
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

// class MainBodyWidget extends StatefulWidget {
//   final dynamic data;
//   MainBodyWidget({required this.data});

//   @override
//   _MainBodyWidgetState createState() => _MainBodyWidgetState();
// }

// class _MainBodyWidgetState extends State<MainBodyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Text(this.widget.data,
//             style: TextStyle(color: AppColors.lightgreen, fontSize: 20)),
//       ],
//     );
//   }
// }
