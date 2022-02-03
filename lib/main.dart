// ignore_for_file: unnecessary_new, sized_box_for_whitespace

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:fijkplayer/fijkplayer.dart';
void main() {
  runApp(const MyApp());
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
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
  List nlist = [];

  // final FijkPlayer player = FijkPlayer();
  var currentIndex = 0;
  final url =
      "https://v26-web.douyinvod.com/0507f95406f60c84feff973e80b71622/61fce1d8/video/tos/cn/tos-cn-ve-15-alinc2/991c76d51c874e939c37f92ebabe1d32/?a=6383&br=1707&bt=1707&cd=0%7C0%7C0%7C0&ch=11&cr=0&cs=0&cv=1&dr=0&ds=3&er=&ft=5q_lc5mmnPRv2FW7ihWwkXAGfdH.Cy2QzBZc&l=20220202161442010151172210362D8635&lr=all&mime_type=video_mp4&net=0&pl=0&qs=0&rc=M2Q8N2Y6ZnJ4OjMzNGkzM0ApZTg1aTRlZDtmNzU5PDNnNmdybzBecjRvLm9gLS1kLS9zczRfYjQvXmEyYGExYWE1YmA6Yw%3D%3D&vl=&vr=";

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Response res = await Dio().get(
      "https://m.toutiao.com/list/?format=json_raw&as=A106515F2BF8DA6");
        // "https://m.toutiao.com/list/?tag=__all__&max_time=0&min_behot_time=0&ac=wap&count=20&format=json_raw&_signature=iZ0QQwAA6HQo9DfwmhFiaImdEF&i=&as=A1C6611F3A32A83&cp=61FAA2CA48031E1&aid=1698");
    setState(() {
      this.nlist = res.data['data'];
    });
    // player.setDataSource(url,autoPlay: true);
  }
  Future <void> _onRefresh()async {
    getData();
  }
  Widget getItem(dynamic item, int i) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 3.0),
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Text(
                  item['title'],
                  style: const TextStyle(fontSize: 17.0),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                )),
            Container(
              margin: const EdgeInsets.only(top: 2.0),
              child: Row(
                children: [
                  Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      child: Text(
                        item['label'] ?? '',
                        style:
                            const TextStyle(fontSize: 10.0, color: Colors.red),
                      )),
                  Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      child: Text(
                        item['media_name'],
                        style: const TextStyle(
                            fontSize: 10.0,
                            color: Color.fromRGBO(153, 153, 153, 1)),
                      )),
                  Container(
                      child: Text(
                    '${item['comment_count']}评论',
                    style: const TextStyle(
                        fontSize: 10.0,
                        color: Color.fromRGBO(153, 153, 153, 1)),
                  )),
                ],
              ),
            ),
          ],
        ));
  }

  List<Widget> elemGrid(List<dynamic> nlist) {
    List<Widget> list = [];
    for (int i = 0; i < nlist.length; i++) {
      list.add(getItem(nlist[i], i));
    }
    return list;
  }

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
        body: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                width: double.infinity,
                height: 80.0,
                color: Colors.red,
                child: Center(
                  child: Container(
                      margin: EdgeInsetsDirectional.only(start: 0, top: 30),
                      width: 340.0,
                      height: 36.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(36)),
                      ),
                      child: Center(
                        child: Container(
                            width: 320.0,
                            height: 32.0,
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  child: const Icon(
                                    Icons.search_outlined,
                                    color: Color.fromRGBO(167, 167, 167, 1),
                                    size: 20, // 图标大小
                                  ),
                                ),
                                Container(
                                  width: 280.0,
                                  height: 25.0,
                                  child: const TextField(
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "请输入要搜索的内容",
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      //去除下边框
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 0),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      )),
                ),
              ),
            ),
            RefreshIndicator(
                child: Container(
                margin: const EdgeInsets.only(top: 80),




                child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Column(children:[
                        Container(
                          width: 340.0,
                          margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 4.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(242, 242, 242, 1)))),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Column(
                                  children: elemGrid(nlist),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 340.0,
                          padding: const EdgeInsets.only(bottom: 12.0),
                          margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 4.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(242, 242, 242, 1)))),
                          child: Column(
                            children: [
                              Container(
                                child: const Text('狗子回乡下过年，每天安排的满满当当，家都不想回来',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left),
                              ),
                              Container(
                                width: double.infinity,
                                height: 200.0,
                                color: const Color.fromRGBO(211, 211, 211, 1),
                                margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
                                child: Container(),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                        child: const Text('巴黎圣母院',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                color: Color.fromRGBO(
                                                    153, 153, 153, 1)))),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: const Text('84评论',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                color: Color.fromRGBO(
                                                    153, 153, 153, 1)))),
                                    Container(
                                        child: const Text('11个月前',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                color: Color.fromRGBO(
                                                    153, 153, 153, 1)))),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 340.0,
                          padding: const EdgeInsets.only(bottom: 12.0),
                          margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 4.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(242, 242, 242, 1)))),
                          child: Column(
                            children: [
                              Container(
                                child: const Text('狗子回乡下过年，每天安排的满满当当，家都不想回来',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left),
                              ),
                              Container(
                                width: double.infinity,
                                height: 200.0,
                                color: Color.fromRGBO(211, 211, 211, 1),
                                margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
                                child: ClipRRect(
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                                  child: Image.network(
                                      "https://www.dillonl.com/static/hu.png",
                                      width: double.infinity,
                                      height: 200.0,
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                        child: const Text('巴黎圣母院',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                color: Color.fromRGBO(
                                                    153, 153, 153, 1)))),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: const Text('84评论',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                color: Color.fromRGBO(
                                                    153, 153, 153, 1)))),
                                    Container(
                                        child: const Text('11个月前',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                color: Color.fromRGBO(
                                                    153, 153, 153, 1)))),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 340.0,
                          padding: const EdgeInsets.only(bottom: 12.0),
                          margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 4.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(242, 242, 242, 1)))),
                          child: Column(
                            children: [
                              Container(
                                child: const Text('虎年春晚收视：平均收视21.93%，贾玲小品第二名，戏曲节目拿第一',
                                    style: TextStyle(fontSize: 16.0),
                                    textAlign: TextAlign.left),
                              ),
                              Container(
                                  width: double.infinity,
                                  margin:
                                  const EdgeInsets.only(top: 6.0, bottom: 6.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 110.0,
                                        height: 100.0,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(4)),
                                          child: Image.network(
                                              "https://www.dillonl.com/static/hu.png",
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      Container(
                                        width: 110.0,
                                        height: 100.0,
                                        margin: EdgeInsets.only(left: 5, right: 5),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(4)),
                                          child: Image.network(
                                              "https://www.dillonl.com/static/hu.png",
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                      Container(
                                        width: 110.0,
                                        height: 100.0,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(4)),
                                          child: Image.network(
                                              "https://www.dillonl.com/static/hu.png",
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.fill),
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                        child: const Text('巴黎圣母院',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                color: Color.fromRGBO(
                                                    153, 153, 153, 1)))),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: const Text('84评论',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                color: Color.fromRGBO(
                                                    153, 153, 153, 1)))),
                                    Container(
                                        child: const Text('11个月前',
                                            style: TextStyle(
                                                fontSize: 11.0,
                                                color: Color.fromRGBO(
                                                    153, 153, 153, 1)))),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ]);
                })),
                onRefresh: _onRefresh,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 18.0,
          fixedColor: Colors.red,
          // 选择的填充色
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: const Color.fromRGBO(64, 64, 64, 1),
          selectedFontSize: 11,
          unselectedFontSize: 11,

          // unselectedLabelStyle: TextStyle(
          //     color: const Color.fromRGBO(64, 64, 64, 1),
          //     fontSize: 12
          // ),

          items: items(currentIndex),
          currentIndex: currentIndex,
          onTap: (int index) {
            currentIndex = index;
            setState(() {});
          },
        ));
  }
}
