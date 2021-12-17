import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon/home_page.dart';
import 'colors.dart' as color;

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  List info=[];
  _initData() => DefaultAssetBundle.of(context).loadString("json/videoinfo.json").
  then((value) => info = json.decode(value));


  @override
  void initState(){
    super.initState();
    _initData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            color.AppColor.gradientFirst.withOpacity(0.8),
            color.AppColor.gradientSecond.withOpacity(0.9),
          ],
          begin: FractionalOffset(0.0, 0.4),
          end: Alignment.topRight,
        )),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 70, left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap:() => Get.to(()=>HomePage()),
                        child: Icon(Icons.arrow_back_ios,
                            size: 20, color: Colors.white60),
                      ),
                      Expanded(child: SizedBox()),
                      Icon(Icons.info, size: 20, color: Colors.white60),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Legs Toning",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "and Glutes Workout",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        // margin: EdgeInsets.only(left: 20),
                        height: 20,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white60,
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white60,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  )),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 30,
                      left: 30,
                      right: 30,
                      bottom: 30,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          "Circuit 1 : Legs Toning",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Icon(Icons.loop),
                        Text("3 sets"),
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
