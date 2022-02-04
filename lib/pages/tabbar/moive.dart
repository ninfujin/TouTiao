import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Moive extends StatefulWidget {
  const Moive({Key? key}) : super(key: key);

  @override
  State<Moive> createState() => _Moive();
}

class _Moive extends State<Moive> {
  List nlist = [];
  var currentIndex = 0;

  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Response res = await Dio()
        .get("https://m.toutiao.com/list/?format=json_raw&as=A106515F2BF8DA6");
    setState(() {
      nlist = res.data['data'];
    });
  }

  Future<void> _onRefresh() async {
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

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                return Column(children: [
                  Container(
                      padding: const EdgeInsets.only(top:14.0,bottom: 5.0),
                      child: Column(children: [
                        Container(
                          width: 340.0,
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween, // 两端对齐
                            children: [
                              Container(
                                child: Center(
                                    child: Row(
                                  children: [
                                    Container(
                                      width: 25.0,
                                      height: 25.0,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(40)),
                                        child: Image.network(
                                            "https://www.dillonl.com/static/hu.png",
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: 8.0, right: 6.0),
                                        child: const Text(
                                          '司马蓝',
                                          style: TextStyle(
                                              fontSize: 13.0,
                                              color: Color.fromRGBO(
                                                  34, 34, 34, 1)),
                                        )),
                                    Container(
                                        margin: const EdgeInsets.only(top: 3.0),
                                        child: const Icon(
                                            IconData(0xe7ac,
                                                fontFamily: 'iconfont'),
                                            color:
                                                Color.fromRGBO(255, 178, 4, 1),
                                            size: 13.0))
                                  ],
                                )),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    const Text('关注',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600)),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            left: 20.0, top: 3.0),
                                        child: const Icon(
                                            IconData(0xec1c,
                                                fontFamily: 'iconfont'),
                                            color:
                                                Color.fromRGBO(72, 72, 72, 1),
                                            size: 10.0))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 340.0,
                          margin: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 8.0),
                          child:Text('一起向未来——习近平总书记关于奥林匹克重要论述的中国实践',style: TextStyle(fontWeight: FontWeight.w800),)
                        ),
                        Container(
                          width: double.infinity,
                          height: 180.0,
                          child: Image.network("https://www.dillonl.com/static/hu.png",width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill),
                        ),
                        Container(
                          width: 340.0,
                          padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Color.fromRGBO(242, 242, 242, 1)))),
                          child:Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween, // 两端对齐
                            children: [
                              Container(
                                child:Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right:6.0),
                                      child: const Icon(IconData(0xe682,fontFamily: 'iconfont'),size:16.0,),
                                    ),
                                    const Text('分享',style: TextStyle(fontSize: 12.0),)
                                  ],
                                )
                              ),
                              Container(
                                  child:Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(right:6.0),
                                        child: const Icon(IconData(0xe686,fontFamily: 'iconfont'),size:13.0,),
                                      ),
                                      const Text('收藏',style: TextStyle(fontSize: 12.0),)
                                    ],
                                  )
                              ),
                              Container(
                                  child:Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(right:4.0),
                                        child: const Icon(IconData(0xe605,fontFamily: 'iconfont'),size:16.0,),
                                      ),
                                      const Text('126',style: TextStyle(fontSize: 12.0))
                                    ],
                                  )
                              ),
                              Container(
                                  child:Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(right:4.0),
                                        child: const Icon(IconData(0xec7f,fontFamily: 'iconfont'),size:16.0),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top:2.0),
                                        child:const Text('1260',style: TextStyle(fontSize: 12.0),)
                                      )
                                    ],
                                  )
                              ),
                            ],
                          )
                        )
                      ])),
                ]);
              })),
          onRefresh: _onRefresh,
        ),
      ],
    );
  }
}
