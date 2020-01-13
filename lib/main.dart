import 'package:bookshare/fristpage/FirstPage.dart';
import 'package:bookshare/personpage/ProfilePage.dart';
import 'package:bookshare/scanpage/ScanQRCodePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(BookShareHomePage());

class BookShareHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark(),
        home: new HomeWeight());
  }
}

class HomeWeight extends StatefulWidget {
  HomeWeight({Key key}) : super(key: key);

  @override
  State createState() {
    return HomeWeightState();
  }
}

class HomeWeightState extends State<HomeWeight> {
  int _currentIndex = 0;

  Widget body = FirstPage();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(title: Text("首页"), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                title: Text("扫一扫"), icon: Icon(Icons.crop_free)),
            BottomNavigationBarItem(
                title: Text("个人中心"), icon: Icon(Icons.person))
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              switch (_currentIndex) {
                case 0:
                  body = FirstPage();
                  break;
                case 1:
                  body = ScanQRCodePage();
                  break;
                case 2:
                  body = ProfilePage();
                  break;
              }
            });
          }),
    );
  }
}

