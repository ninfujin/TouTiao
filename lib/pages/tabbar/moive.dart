import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Moive extends StatefulWidget {
  const Moive({Key? key}) : super(key: key);

  @override
  State<Moive> createState() => _Moive();
}

class _Moive extends State<Moive> {
  List mlist = [{
    "data": {
      "title": "日军“最强军团”，坑害友军无数，一听日本投降个个兴奋异常",
      "image_url": "http://p26-sign.bdxiguaimg.com/tos-cn-i-0004/46385eb2eec5445e9b87250ed22e5bbd~tplv-pk90l89vgd-crop-center:864:486.webp?x-expires=1675502262&x-signature=RU38QaJOmgFxTV95P2ol19fmhi0%3D",
      "playNum": 813436,
      "commentNum": 650,
      "duration": 641,
      "user_info": {
        "avatar_url": "https://sf6-cdn-tos.bdxiguastatic.com/img/user-avatar/01dcaccb7c305cd9b9bacefb2a8b9a38~300x300.image",
        "name": "猿叔史记",
        "author_desc": "10万 粉丝",
        "video_total_count": 13,
        "followers_count_str": "10万"
      },
      "preview_url": "http://v9-xg-web-s.ixigua.com/3f87cb427acd3067b6ddc5c567a97f2e/61ff9238/video/tos/cn/tos-cn-v-0000c2429/7d17af3bb1824f9faecae613de20b80e/?a=1768&br=1261&bt=1261&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&dr=0&ds=1&er=&ft=slcfp33Gnz7ThJXBxlXq&l=2022020417174101021216016105453605&lr=&mime_type=video_mp4&net=0&pl=0&qs=13&rc=MzZ1dDU6Znk6OjMzNGc8M0ApOGRrPHg6bXhtZjMzajo1eWcyXmU2cjRncmdgLS1kNC9zcy0wb24vNGBzNDQtLS5hNi06Yw%3D%3D&vl=&vr=",
    },
  }];

  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Dio dio = new Dio();
    dio.options.headers["referer"] = "https://www.ixigua.com/";
    Response res = await dio.get(
        "https://www.ixigua.com/api/feedv2/feedById?_signature=_02B4Z6wo00f01E7hKwgAAIDAzuPRSITmcWhOxS-AAHJMa1&channelId=94349543909&count=90&maxTime=1643960038&request_from=701&queryCount=2&referrer=");
    setState(() {
      mlist = res.data['data']['channelFeed']['Data'];
    });

  }

  Future<void> _onRefresh() async {
    getData();
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
                  itemBuilder: (BuildContext context, int i) {
                    return Column(children: mlist.map<Widget>((v){
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
                  physics: const PageScrollPhysics())),
          onRefresh: _onRefresh,
        )
      ],
    );
  }
}
