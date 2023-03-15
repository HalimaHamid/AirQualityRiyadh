

import 'package:flutter/material.dart';

class PM25 extends StatelessWidget {
  const PM25({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riyadh Air Quality"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Padding( padding: EdgeInsets.only(top: 30,left: 20,right: 20),
            child: Column(
              children: [
                Text("PM2.5"),
                SizedBox(height: 20,),
                Image.asset("assets/pm25.png"),
                SizedBox(height: 30,),
                Text(style: TextStyle(fontSize: 20),textAlign: TextAlign.center,"PM2.5 are those less than 2.5 pm in diameter. Although technically this isn't correct, it is a simplistic way of explaining the small sizes of these particles. Concern about the potential health impacts of PM10 has increased very rapidly over recent years. However, increasingly, attention has been turning towards monitoring to the finer (smaller) particle fraction (PM2.5) capable of penetrating deeper into the lungs")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
