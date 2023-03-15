import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:smaq/pages/infoPage.dart';

import 'package:url_launcher/url_launcher.dart';
import '../services/local_notification_service.dart';
import '../utils/category_item.dart';
import 'about_page.dart';
import '../utils/category.dart';


void main() => runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePageF()
    )
);

class HomePageF extends StatefulWidget {
  @override
  _HomePageFState createState() => _HomePageFState();
}

class _HomePageFState extends State<HomePageF> {
  //final getData data = new getData();
  List<dynamic> DUMMY_CATEGORIES = [];


  // code for firebase FCM token and to manage notifications
  String deviceTokenToSendPushNotification = "";
  @override
  void initState() {
    super.initState();

    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
          (message) {
        print("not___ in terminated state");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
          (message) {
        print("not___ in forground state");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);

        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("not___ in background state");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");

        }
      },
    );
  }
  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final token = await _fcm.getToken();
    deviceTokenToSendPushNotification = token.toString();
    print("Token___ Value $deviceTokenToSendPushNotification");
  }

  @override
  Widget build(BuildContext context) {
    getDeviceTokenToSendNotification();
    getApiData();
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(.4),
                            Colors.black.withOpacity(.2),
                          ]
                      )
                  ),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[

                    Padding( padding: EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          SizedBox(
                            height: 40,
                            width: 60,
                            /*child: Lottie.asset(
                              'assets/wind_mills.json',
                            ),*/
                          ),


                          FloatingActionButton.small(onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => InfoPage()),
                              //MaterialPageRoute(builder: (context) => AboutPageObj()),
                            );
                          }, child: Icon(Icons.info_outline),),
                        ],),
                    ),

                    Image.asset("assets/mlogo.png", height: 80,),

                    Text("Riyadh Air Quality", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                    /*Padding(padding: EdgeInsets.only(left: 30,right: 20),
                        child: Text("This Dashboard shows the amount of pollutants in the air where device is present", style: TextStyle(color: Colors.white, fontSize: 15,),
                          textAlign: TextAlign.center,
                        )
                    ),*/
                    SizedBox(height: 10,),

                    GestureDetector(
                      onTap: () => _launchURL(),
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child: Center(child: Text("Air Quality Data", style: TextStyle(color: Colors.blue, fontSize: 24),)),
                      ),
                    ),

                    SizedBox(height: 30,),
                  ],
                    ),

                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 3/2,
                    ),
                    itemCount: DUMMY_CATEGORIES.length,

                    itemBuilder: (BuildContext context, int index) {
                      if(index == DUMMY_CATEGORIES.length)
                        return Container(
                          color: Colors.lightGreen,
                          width: 0.5,
                          child: CircularProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.black,
                            semanticsLabel: "Loading",
                      ),
                        );
                      final Field = DUMMY_CATEGORIES[index];
                      Category f = Field;
                      return CategoryItem(f.title,f.color,f.val);
                    },
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }


  static var lst_title = [];
  static var lst_vals = [];

  getApiData() async {
    print("fetchUsers Called");

    // for chanel 1
    const url = 'https://api.thingspeak.com/channels/1905991/feeds.json?results=2';
    final uri = Uri.parse(url);

    try{
      final response = await http.get(uri);
      if (response.statusCode == 200 ){
        print("success");
        final data = jsonDecode(response.body);

        final f1 = data['channel']["field1"];
        final f2 = data['channel']["field2"];
        final f4 = data['channel']["field4"];
        final f5 = data['channel']["field5"];
        final f6 = data['channel']["field6"];
        final f7 = data['channel']["field7"];
        final f8 = data['channel']["field8"];

        lst_title.clear();
        lst_title.add(f1);
        lst_title.add(f2);
        lst_title.add(f4);
        lst_title.add(f5);
        lst_title.add(f6);
        lst_title.add(f7);
        lst_title.add(f8);

        final last_entry_id = data['channel']["last_entry_id"];

        for( var i = 0 ; i < data['feeds'].length; i++){
          if (last_entry_id == data['feeds'][i]["entry_id"]){
            final entry_id = data['feeds'][i]["entry_id"];
            print("entery id______");
            print(entry_id.toString());

            final val1 = data['feeds'][i]["field1"];
            final val2 = data['feeds'][i]["field2"];
            final val4 = data['feeds'][i]["field4"];
            final val5 = data['feeds'][i]["field5"];
            final val6 = data['feeds'][i]["field6"];
            final val7 = data['feeds'][i]["field7"];
            final val8 = data['feeds'][i]["field8"];

            lst_vals.clear();
            lst_vals.add(toInt(val1));
            lst_vals.add(toInt(val2));
            lst_vals.add(toInt(val4));
            lst_vals.add(toInt(val5));
            lst_vals.add(toInt(val6));
            lst_vals.add(toInt(val7));
            lst_vals.add(toInt(val8));

            print("val _____");
            print(val1);

          }
        }

        //////////

        print(data);
        print("Result :");
        print(lst_title);

      }else{
        print("Something went wrong in API_1");
      }
    }catch(ex){

    }

    // for chanel 2
    const url2 = 'https://api.thingspeak.com/channels/2002482/feeds.json?results=2';
    final uri2 = Uri.parse(url2);

    try{
      final response2 = await http.get(uri2);
      if(response2.statusCode==200){
        final data = jsonDecode(response2.body);

        final f1 = data['channel']["field1"];
        final f2 = data['channel']["field2"];

        lst_title.add(f1);
        lst_title.add(f2);

        final last_entry_id = data['channel']["last_entry_id"];
        for( var i = 0 ; i < data['feeds'].length; i++){
          if (last_entry_id == data['feeds'][i]["entry_id"]){
            final entry_id = data['feeds'][i]["entry_id"];
            print("entery id______2");
            print(entry_id.toString());

            final val1 = data['feeds'][i]["field1"];
            final val2 = data['feeds'][i]["field2"];

            lst_vals.add(toInt(val1));
            lst_vals.add(toInt(val2));

          }
        }

      }
    }catch(ex){

    }

    setState(() {

      DUMMY_CATEGORIES.clear();
      DUMMY_CATEGORIES.add(Category(id: "1", title: lst_title[0], color: Colors.blue,val: lst_vals[0]),);
      DUMMY_CATEGORIES.add(Category(id: "2", title: lst_title[1], color: Colors.blue,val: lst_vals[1]),);
      DUMMY_CATEGORIES.add(Category(id: "3", title: lst_title[2], color: Colors.blue,val: lst_vals[2]),);
      DUMMY_CATEGORIES.add(Category(id: "4", title: lst_title[3], color: Colors.blue,val: lst_vals[3]),);
      DUMMY_CATEGORIES.add(Category(id: "5", title: lst_title[4], color: Colors.blue,val: lst_vals[4]),);
      DUMMY_CATEGORIES.add(Category(id: "6", title: lst_title[5], color: Colors.blue,val: lst_vals[5]),);
      DUMMY_CATEGORIES.add(Category(id: "7", title: lst_title[6], color: Colors.blue,val: lst_vals[6]),);

      DUMMY_CATEGORIES.add(Category(id: "8", title: lst_title[7], color: Colors.blue,val: lst_vals[7]),);
      DUMMY_CATEGORIES.add(Category(id: "9", title: lst_title[8], color: Colors.blue,val: lst_vals[8]),);

    });
  }

  static int toInt(var val){
    if(val!=null){
      return int.parse(val);
    }else{
      return 0;
    }
  }

  _launchURL() async {
    const url = "http://airmonitorriyadh.live/";
    try{
      await launch(url);
    }catch(ex){
      print(ex.toString());
    }
  }
}