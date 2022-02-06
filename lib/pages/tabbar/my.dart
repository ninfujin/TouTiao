import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

class My extends StatefulWidget {
  const My({Key? key}) : super(key: key);

  @override
  State<My> createState() => _My();
}

class _My extends State<My> {
  void initState() {
    super.initState();
  }
  List list = [
    {'title':'大字模式','icon':0xe6cb},
    {'title':'订单','icon':0xe69f},
    {'title':'用户反馈','icon':0xe641},
    {'title':'钱包','icon':0xe61d},
    {'title':'借钱','icon':0xe612},
    {'title':'广告推广','icon':0xe60b},
    {'title':'免流量服务','icon':0xe60a},
    {'title':'评论','icon':0xe61e},
    {'title':'点赞','icon':0xec7f},
    {'title':'安全中心','icon':0xec4d},
    {'title':'隐私设置','icon':0xe6af},
    {'title':'深色模式','icon':0xe63e},
  ];
  List<Widget> getData(){
    return list.map<Widget>((v){
      return Container(
           width: 68,
           // color: Colors.red,
           child: Column(
              children: [
                 Icon(
                  IconData(v['icon'], fontFamily: 'iconfont'),
                  size: 22,
                ),
                Container(
                    margin: EdgeInsets.only(top:3.0),
                    child:Text(v['title'], style: TextStyle(fontSize: 12))
                )
              ],
            ),
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
        constraints: BoxConstraints(minHeight: height),
        color: const Color.fromRGBO(245, 245, 245, 1),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                width: double.infinity,
                height: 80.0,
                child: Center(
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(top: 30),
                    width: 340.0,
                    height: 36.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 36.0,
                            child: const Icon(
                              IconData(0xe8b5, fontFamily: 'iconfont'),
                              size: 20.0,
                            )),
                        Container(
                            width: 60.0,
                            height: 36.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Icon(
                                  IconData(0xe639, fontFamily: 'iconfont'),
                                  size: 20.0,
                                ),
                                Icon(
                                  IconData(0xeb8d, fontFamily: 'iconfont'),
                                  size: 20.0,
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
                width: 340.0,
                margin: const EdgeInsets.only(top: 80, left: 10, right: 10),
                child: Container(
                    child: Column(children: [
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Row(children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              margin: const EdgeInsets.only(right: 16),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(50)),
                                child: Image.network(
                                    "https://www.dillonl.com/static/hu.png",
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.fill),
                              ),
                            ),
                            const Text(
                              '书本书华',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w800),
                            )
                          ])),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(right: 4),
                                    child: const Text('个人主页',
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Color.fromRGBO(
                                                187, 187, 187, 1)))),
                                const Icon(
                                    IconData(0xe617, fontFamily: 'iconfont'),
                                    size: 12.0,
                                    color: Color.fromRGBO(187, 187, 187, 1))
                              ],
                            ),
                          )
                        ]),
                  ),
                  Container(
                    width: 320,
                    margin: const EdgeInsets.only(top: 14, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(children: const [
                            Text("0",
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w900)),
                            Text("头条",
                                style: TextStyle(
                                    fontSize: 11.0,
                                    color: Color.fromRGBO(122, 122, 122, 1))),
                          ]),
                        ),
                        Container(
                          child: Column(children: const [
                            Text("0",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w900)),
                            Text("获赞",
                                style: TextStyle(
                                    fontSize: 11.0,
                                    color: Color.fromRGBO(122, 122, 122, 1))),
                          ]),
                        ),
                        Container(
                          child: Column(children: const [
                            Text("0",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w900)),
                            Text("粉丝",
                                style: TextStyle(
                                    fontSize: 11.0,
                                    color: Color.fromRGBO(122, 122, 122, 1))),
                          ]),
                        ),
                        Container(
                          child: Column(children: const [
                            Text("0",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w900)),
                            Text("关注",
                                style: TextStyle(
                                    fontSize: 11.0,
                                    color: Color.fromRGBO(122, 122, 122, 1))),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    margin: const EdgeInsets.only(top: 15.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                    child: Center(
                        child: Container(
                      width: 320.0,
                      height: 45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Icon(IconData(0xe61f, fontFamily: 'iconfont'),
                                  size: 20,color:Colors.red),
                              Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: const Text('消息通知',
                                      style: TextStyle(fontSize: 11.0)))
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(IconData(0xe686, fontFamily: 'iconfont'),
                                  size: 20,color:Colors.red),
                              Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: const Text('收藏',
                                      style: TextStyle(fontSize: 11.0)))
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(IconData(0xe63b, fontFamily: 'iconfont'),
                                  size: 20,color:Colors.red),
                              Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: const Text('浏览历史',
                                      style: TextStyle(fontSize: 11.0)))
                            ],
                          ),
                          Column(
                            children: [
                              const Icon(IconData(0xe638, fontFamily: 'iconfont'),
                                  size: 20,color:Colors.red),
                              Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  child: const Text('下载管理',
                                      style: TextStyle(fontSize: 11.0)))
                            ],
                          ),
                        ],
                      ),
                    )),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 15.0),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 12, bottom: 12),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '记录新鲜事',
                            style: TextStyle(fontSize: 14.0),
                          ),
                          Container(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 3, right: 10, bottom: 3),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red, //边框颜色
                                  width: 1.0, //边框粗细
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: Center(
                                  child: Row(
                                children: [
                                  const Icon(IconData(0xe727, fontFamily: 'iconfont'),
                                      color: Colors.red, size: 10.0),
                                  Container(
                                      margin: const EdgeInsets.only(left: 4.0),
                                      child: const Text(
                                        '发布',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12),
                                      ))
                                ],
                              )))
                        ]),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15.0),
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 12, bottom: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('更多服务',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                            Container(
                              child: Row(
                                children: [
                                  const Text(
                                    '全部',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromRGBO(189, 189, 189, 1)),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 4.0),
                                      child: const Icon(
                                        IconData(0xe617,
                                            fontFamily: 'iconfont'),
                                        size: 10,
                                        color: Color.fromRGBO(189, 189, 189, 1),
                                      ))
                                ],
                              ),
                            )
                          ],
                        )),
                        Container(
                          width: 320.0,
                          margin: EdgeInsets.only(top:20),
                          child:  Wrap(
                            spacing: 15,
                            runSpacing: 20,
                            alignment: WrapAlignment.start,
                            runAlignment: WrapAlignment.end,
                            children: getData()
                          ),
                        )
                      ],
                    ),
                  )
                ])))
          ],
        ));
  }
}
