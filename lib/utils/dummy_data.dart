/*


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'category.dart';


var DUMMY_CATEGORIES = [];

*/
/*const DUMMY_CATEGORIES = const [
  Category(id: "1", title: "CO", color: Colors.blue,val: 20),

];*//*


class getData{

  static var lst_title = [];
  static var lst_vals = [];

  static getApiData() async {
    var url = Uri.parse('https://api.thingspeak.com/channels/1905991/feeds.json?results=2');
    Response response = await get(url);
    print(response.statusCode);
    if (response.statusCode == 200){
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

      DUMMY_CATEGORIES.clear();
      DUMMY_CATEGORIES.add(Category(id: "1", title: lst_title[0], color: Colors.blue,val: lst_vals[0]),);
      DUMMY_CATEGORIES.add(Category(id: "2", title: lst_title[1], color: Colors.blue,val: lst_vals[1]),);
      DUMMY_CATEGORIES.add(Category(id: "3", title: lst_title[2], color: Colors.blue,val: lst_vals[2]),);
      DUMMY_CATEGORIES.add(Category(id: "4", title: lst_title[3], color: Colors.blue,val: lst_vals[3]),);
      DUMMY_CATEGORIES.add(Category(id: "5", title: lst_title[4], color: Colors.blue,val: lst_vals[4]),);
      DUMMY_CATEGORIES.add(Category(id: "6", title: lst_title[5], color: Colors.blue,val: lst_vals[5]),);
      DUMMY_CATEGORIES.add(Category(id: "7", title: lst_title[6], color: Colors.blue,val: lst_vals[6]),);

      print(data);
      print("Result :");
      print(lst_title);

    }else{
      print("Something went wrong");
    }

  }
  static int toInt(var val){
    if(val!=null){
      return int.parse(val);
    }else{
      return 0;
    }
  }

}*/
