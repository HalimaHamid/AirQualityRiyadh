import 'dart:ui';

import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:  /*Color(0xFF363567)*/ Color(0xffffffff),
      body: Column(
          children: [
            Stack(children: [
              Transform.rotate(origin: Offset(30,-60), angle: 2.4, child: Container(
                margin: EdgeInsets.only(left: 75, top: 40),
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(80),
                gradient: LinearGradient(begin: Alignment.bottomLeft,
                    colors: [
                      /*Color(0xffFD8BAB)*/ Color(0xff0a5ae1),
                      /*, Color(0xFFFD44C4)*/ Color(0xFF41AEE1)
                    ],
                )
                ),
              ),),

              Transform.rotate(origin: Offset(-20,380), angle: 2.4, child: Container(
                margin: EdgeInsets.only(left: 75, top: 40),
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(80),
                    gradient: LinearGradient(begin: Alignment.bottomLeft,
                      colors: [
                        /*Color(0xffFD8BAB)*/ Color(0xff0a5ae1),
                        /*, Color(0xFFFD44C4)*/ Color(0xFF41AEE1)
                      ],
                    )
                ),
              ),),
              Padding( padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),


                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Riyadh Air Monitor', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),),
                      FloatingActionButton.small(onPressed: (){}, child: Icon(Icons.info_outline),)
                    ],
                  ),

                SizedBox(height: 10,),
                Text('Amount of pollutants in the air where device is present', style: TextStyle(color: Colors.white, fontSize: 18),),

                  Padding(padding: EdgeInsets.only(top: 20),

                    /*child: Column(
                    children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(
                        alignment: Alignment.center,
                        height: 177, width: 160,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0x970B4F92)),
                        child:
                        Column(
                          children: [
                            SizedBox(height: 60,),
                            Text("456", style: TextStyle(fontSize: 40, color: Colors.white),),
                            SizedBox(height: 30,),
                            Text("NO2", style: TextStyle(fontSize: 15, color: Colors.white),),
                          ],
                        )

                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 177, width: 160,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0x970B4F92)),
                        child:
                        Column(
                          children: const [
                            SizedBox(height: 60,),
                            Text("556", style: TextStyle(fontSize: 40, color: Colors.white),),
                            SizedBox(height: 30,),
                            Text("CO2", style: TextStyle(fontSize: 15, color: Colors.white),),
                          ],
                        )
                      )
                    ],),
                      SizedBox(height: 20,),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 177, width: 160,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0x970B4F92)),
                          child: Column(
                            children: [
                              SizedBox(height: 60,),
                              Text("162", style: TextStyle(fontSize: 40, color: Colors.white),),
                              SizedBox(height: 30,),
                              Text("So2", style: TextStyle(fontSize: 15, color: Colors.white),),
                            ],
                          )
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 177, width: 160,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0x970B4F92)),
                          child:
                          Column(
                            children: [
                              SizedBox(height: 60,),
                              Text("321", style: TextStyle(fontSize: 40, color: Colors.white),),
                              SizedBox(height: 30,),
                              Text("NH3", style: TextStyle(fontSize: 15, color: Colors.white),),
                            ],
                          )
                        )
                      ],),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 177, width: 160,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0x970B4F92)),
                            child: Column(
                              children: [
                                SizedBox(height: 60,),
                                Text("320", style: TextStyle(fontSize: 40, color: Colors.white),),
                                SizedBox(height: 30,),
                                Text("O3", style: TextStyle(fontSize: 15, color: Colors.white),),
                              ],
                            )

                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 177, width: 160,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0x970B4F92)),
                            child:
                            Column(
                              children: [
                                SizedBox(height: 60,),
                                Text("480", style: TextStyle(fontSize: 40, color: Colors.white),),
                                SizedBox(height: 30,),
                                Text("Dust", style: TextStyle(fontSize: 15, color: Colors.white),),
                              ],
                            )
                          )
                        ],),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              height: 177, width: 160,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0x970B4F92)),
                              child: Column(
                                children: [
                                  SizedBox(height: 60,),
                                  Text("320", style: TextStyle(fontSize: 40, color: Colors.white),),
                                  SizedBox(height: 30,),
                                  Text("O3", style: TextStyle(fontSize: 15, color: Colors.white),),
                                ],
                              )

                          ),
                          Container(
                              alignment: Alignment.center,
                              height: 177, width: 160,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Color(0x970B4F92)),
                              child:
                              Column(
                                children: [
                                  SizedBox(height: 60,),
                                  Text("480", style: TextStyle(fontSize: 40, color: Colors.white),),
                                  SizedBox(height: 30,),
                                  Text("Dust", style: TextStyle(fontSize: 15, color: Colors.white),),
                                ],
                              )
                          )
                        ],)
                  ],),*/
                  ),

              ],
              ),
              )
            ],)
          ]
        ),

  );
  }
}