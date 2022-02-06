import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';
class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _Video();
}

class _Video extends State<Video> {
  void initState() {
    super.initState();
    getData();
  }

  Future<Response>  getData() async {
    Dio dio = new Dio();
    Response res = await dio.get("https://www.dillonl.com/toutiao/video");
    return res;
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
        FutureBuilder(
          future: getData(),
            builder: (BuildContext context, AsyncSnapshot<Response> snapshot){
              if(snapshot.hasData){
                List vlist = json.decode(snapshot.data!.data)['Data'];
                return Container(
                    margin: const EdgeInsets.only(top: 80),
                    child: ListView.builder(
                        itemBuilder: (BuildContext context, int i) {
                          return Column(children: vlist.map<Widget>((v){
                            return Container(
                                padding:
                                const EdgeInsets.only(top: 14.0, bottom: 5.0),
                                child: Column(children: [
                                  Container(
                                    width: 340.0,
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween, // 两端对齐
                                      children: [
                                        Container(
                                          child: Center(
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 25.0,
                                                    height: 25.0,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(40)),
                                                      child: Image.network(
                                                          v['data']['user_info']['avatar_url'],
                                                          width: double.infinity,
                                                          height: double.infinity,
                                                          fit: BoxFit.fill),
                                                    ),
                                                  ),
                                                  Container(
                                                      margin: const EdgeInsets.only(
                                                          left: 8.0, right: 6.0),
                                                      child: Text(
                                                        v['data']['user_info']['name'],
                                                        style:const TextStyle(
                                                            fontSize: 13.0,
                                                            color: Color.fromRGBO(
                                                                34, 34, 34, 1)),
                                                      )),
                                                  v['data']['user_info']['user_verified'] == true ? Container(
                                                      margin:
                                                      const EdgeInsets.only(top: 3.0),
                                                      child: const Icon(
                                                          IconData(0xe7ac,
                                                              fontFamily: 'iconfont'),
                                                          color: Color.fromRGBO(
                                                              255, 178, 4, 1),
                                                          size: 13.0)) : Container()
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
                                                      color: Color.fromRGBO(
                                                          72, 72, 72, 1),
                                                      size: 10.0))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      width: 340.0,
                                      margin: const EdgeInsets.fromLTRB(
                                          10.0, 5.0, 10.0, 8.0),
                                      child: Text(
                                        v['data']['title'],
                                        style: TextStyle(fontWeight: FontWeight.w800),
                                      )),
                                  Container(
                                    width: double.infinity,
                                    height: 180.0,
                                    child: Image.network(
                                        v['data']['image_url'],
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.fill),
                                  ),
                                  Container(
                                      width: 340.0,
                                      padding: const EdgeInsets.fromLTRB(
                                          10.0, 15.0, 10.0, 15.0),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Color.fromRGBO(
                                                      242, 242, 242, 1)))),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween, // 两端对齐
                                        children: [
                                          Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                    const EdgeInsets.only(right: 6.0),
                                                    child: const Icon(
                                                      IconData(0xe682,
                                                          fontFamily: 'iconfont'),
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                  const Text(
                                                    '分享',
                                                    style: TextStyle(fontSize: 12.0),
                                                  )
                                                ],
                                              )),
                                          Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                    const EdgeInsets.only(right: 6.0),
                                                    child: const Icon(
                                                      IconData(0xe686,
                                                          fontFamily: 'iconfont'),
                                                      size: 13.0,
                                                    ),
                                                  ),
                                                  const Text(
                                                    '收藏',
                                                    style: TextStyle(fontSize: 12.0),
                                                  )
                                                ],
                                              )),
                                          Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                    const EdgeInsets.only(right: 4.0),
                                                    child: const Icon(
                                                      IconData(0xe605,
                                                          fontFamily: 'iconfont'),
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                  Text(v['data']['commentNum'].toString(),
                                                      style: TextStyle(fontSize: 12.0))
                                                ],
                                              )),
                                          Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin:
                                                    const EdgeInsets.only(right: 4.0),
                                                    child: const Icon(
                                                        IconData(0xec7f,
                                                            fontFamily: 'iconfont'),
                                                        size: 16.0),
                                                  ),
                                                  Container(
                                                      margin:
                                                      const EdgeInsets.only(top: 2.0),
                                                      child: Text(
                                                        v['data']['duration'].toString(),
                                                        style: const TextStyle(fontSize: 12.0),
                                                      ))
                                                ],
                                              )),
                                        ],
                                      ))
                                ]));
                          }).toList());
                        },
                        physics: const PageScrollPhysics()));
              }else{
                return const Center(child:Text("加载中...",style: TextStyle(fontSize:12.0,color: Color.fromRGBO(129, 129, 129, 1)),));
              }
            },
          ),
      ],
    );
  }
}
