import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:smaq/pages/AboutSMAQPage.dart';
import 'package:smaq/pages/LicencePage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:smaq/pages/indicis.dart';
import 'package:smaq/pages/contact.dart';

import 'HomePageF.dart';
import 'about_page.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Riyadh Air Quality",
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 1,
              width: double.infinity,
              color: Color(0xffd7d8d9),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutSMAQPage()),
                    //MaterialPageRoute(builder: (context) => AboutPageObj()),
                  );
                },
                child: Text(
                  "About App",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Color(0xffd7d8d9),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () => MapsLauncher.launchQuery(''),
                child: Text(
                  "Location",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Color(0xffd7d8d9),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ButtonList()),
                    //MaterialPageRoute(builder: (context) => AboutPageObj()),
                  );
                },
                child: Text(
                  "Air Quality Index",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Color(0xffd7d8d9),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  _launchURL();
                },
                child: Text(
                  "Visit Our Website",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Color(0xffd7d8d9),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LicencePage()),
                    //MaterialPageRoute(builder: (context) => AboutPageObj()),
                  );
                },
                child: Text(
                  "Licenses",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Color(0xffd7d8d9),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactPage()),
                    //MaterialPageRoute(builder: (context) => AboutPageObj()),
                  );
                },
                child: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Color(0xffd7d8d9),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const url = "http://airmonitorriyadh.live/";
    try {
      await launch(url);
    } catch (ex) {
      print(ex.toString());
    }
  }
}
