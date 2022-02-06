import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toutiao_demo/pages/tabbar/home.dart';
import 'package:toutiao_demo/pages/tabbar/moive.dart';
import 'package:toutiao_demo/pages/tabbar/video.dart';
import 'package:toutiao_demo/pages/tabbar/my.dart';

void main() {
  runApp(const MyApp());
  if (Platform.isAndroid) {
    // 改变沉浸式导航颜色
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '今日头条D',
        theme: ThemeData(
            // 取消点击切换的水波纹
            primaryColor: Colors.greenAccent,
            highlightColor: const Color.fromRGBO(0, 0, 0, 0),
            splashColor: const Color.fromRGBO(0, 0, 0, 0)),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 3;

  @override
  void initState() {
    super.initState();
  }

  List pages = [const Home(), const Video(), const Moive(), const My()];

  @override
  List<BottomNavigationBarItem> items(int i) {
    return [
      BottomNavigationBarItem(
          icon:
              Icon(IconData(i == 0 ? 0xe608 : 0xe609, fontFamily: 'iconfont')),
          label: '首页'),
      BottomNavigationBarItem(
          icon:
              Icon(IconData(i == 1 ? 0xea82 : 0xe600, fontFamily: 'iconfont')),
          label: '视频'),
      BottomNavigationBarItem(
          icon:
              Icon(IconData(i == 2 ? 0xe6d6 : 0xe6be, fontFamily: 'iconfont')),
          label: '放映厅'),
      BottomNavigationBarItem(
          icon:
              Icon(IconData(i == 3 ? 0xe60d : 0xe60f, fontFamily: 'iconfont')),
          label: '我的'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 18.0,
          fixedColor: Colors.red,
          // 选择的填充色
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color.fromRGBO(64, 64, 64, 1),
          selectedFontSize: 11,
          unselectedFontSize: 11,
          items: items(currentIndex),
          currentIndex: currentIndex,
          onTap: (int index) {
            currentIndex =  index;
            setState(() {});
          },
        ));
  }
}
