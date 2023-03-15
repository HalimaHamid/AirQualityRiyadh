import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSMAQPage extends StatelessWidget {
  const AboutSMAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About SMAQ", style: TextStyle(fontSize: 24)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/banner.jpeg"),
            SizedBox(
              height: 20,
            ),
            Text(
              textAlign: TextAlign.justify,
              "This App shows the air quality in Riyadh through device in vital places of the city.\nIn order to publish the real time information about air quality, this application was made available, as it displays accurate indicators of the level of pollution (gases and suspended particles) directly and accessible.\nThe application provides complete information about air quality in surrounding area of a device.",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "For any enquiry",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  _launchURL("https://www.facebook.com/");
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/facebook.png',
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Like on Facebook",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                )),
            ElevatedButton(
                onPressed: () {
                  _launchURL("https://twitter.com/?lang=en");
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/twitter.png',
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Follow on Twitter",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  _launchURL(String url_v) async {
    var url = url_v;
    try {
      await launch(url);
    } catch (ex) {
      print(ex.toString());
    }
  }
}
