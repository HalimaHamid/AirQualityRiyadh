import 'package:flutter/material.dart';

import 'About-Page.dart';

class AboutPageObj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AboutPage ab = AboutPage();
    ab.customStyle(
        descFontFamily: "Roboto", listTextFontFamily: "RobotoMedium");

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Contuct Us"),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),

              ab.setImage("assets/logo.png"),
              ab.addDescription(
                  "Contact us for any queries and suggestions for upcoming versions"),
              ab.addWidget(
                Text(
                  "Version 1.2",
                  style: TextStyle(fontFamily: "RobotoMedium"),
                ),
              ),

              ab.addGroup(""),
              ab.addEmail("shaimaobaidalrasheedi@gmail.com"),
              ab.addFacebook(""),
              ab.addTwitter(""),
              ab.addYoutube(""),
              ab.addPlayStore(""),
              ab.addInstagram(""),
              ab.addWebsite("http://www.airmonitorriyadh.live"),
              //  ab.addItemWidget(Icon(Icons.add), "title")
            ],
          ),
        ));
  }
}
