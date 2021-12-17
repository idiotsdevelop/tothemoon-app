import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import "package:get/get.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moon/details.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info=[];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      info = json.decode(value);
    });
  }

  @override
  void initState(){
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color.AppColor.homePageBackground,
        body: Container(
          // height: MediaQuery.of(context).size.height,
          // width : MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 70, left: 30, right: 30),

          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Training",
                    style: TextStyle(
                      fontSize: 30,
                      color: color.AppColor.homePageTitle,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: color.AppColor.homePageIcons,
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Training",
                    style: TextStyle(
                      fontSize: 20,
                      color: color.AppColor.homePageSubtitle,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Text("Training",
                      style: TextStyle(
                        fontSize: 20,
                        color: color.AppColor.homePageSubtitle,
                        fontWeight: FontWeight.w700,
                      ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () => Get.to(()=>Details()),
                    child: Icon(Icons.arrow_forward,
                        size: 20, color: color.AppColor.homePageIcons),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        // 그라이데이션 시작과 끝 색깔 withOpacity 는 색의 농도 설정
                        color.AppColor.gradientFirst.withOpacity(0.8),
                        color.AppColor.gradientSecond.withOpacity(0.9),
                      ],
                      // begin : 가장 색이 진한곳부터 ~ end : 가장 색이 연한 곳까지
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight,
                    ),
                    // color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(90),
                    ),
                    // 그림자
                    boxShadow: [
                      BoxShadow(
                          // offset 첫번째 인자는 가로 두번째는 세로
                          offset: Offset(5, 10),
                          blurRadius: 20,
                          color: color.AppColor.gradientSecond.withOpacity(0.2))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Next workout",
                        style: TextStyle(
                            fontSize: 16,
                            color: color.AppColor.homePageContainerTextSmall)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Legs Toning",
                        style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.homePageContainerTextSmall)),
                    Text("and Glutes Workout",
                        style: TextStyle(
                            fontSize: 25,
                            color: color.AppColor.homePageContainerTextSmall)),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.timer,
                          size: 20,
                          color: color.AppColor.homePageContainerTextSmall,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "60 min",
                          style: TextStyle(
                              fontSize: 14,
                              color: color.AppColor.homePageContainerTextSmall),
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: color.AppColor.gradientFirst,
                                    blurRadius: 10,
                                    offset: Offset(4, 4))
                              ]),
                          child: Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 60,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 180,
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(
                //   // color: Colors.red,
                // ),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 30),
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage("assets/card.jpg"),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 10,
                              offset: Offset(0.2, 0.2),
                              color: Colors.black12,
                            ),
                            BoxShadow(
                              blurRadius: 20,
                              offset: Offset(-0.2, -0.2),
                              color: Colors.black,
                            ),
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: 140,
                      ),
                      // width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/figure.png"),
                        fit: BoxFit.fill,
                      )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Area of foucs",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(child: ListView.builder(
                  itemCount: info.length, //2
                  itemBuilder: (_ ,i) {
                return Column(
                  children: [
                    Container(
                      width : 200,
                      height : 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(
                            info[i]['img']
                          )
                        ),

                      ),
                      child: Center(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            info[i]["title"],
                            style : TextStyle(
                              fontSize: 20,
                              color:color.AppColor.homePageDetail,
                            )
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }))
            ],
          ),
        ));
  }
}
