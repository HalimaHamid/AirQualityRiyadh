import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage {
  String descFontFamily = "Roboto";
  String listTextFontFamily = "RobotoMedium";

  // All the properties of AboutPage library
  customStyle(
      {descFontFamily = "Roboto", listTextFontFamily = "RobotoMedium"}) {
    this.descFontFamily = descFontFamily;
    this.listTextFontFamily = listTextFontFamily;
  }

  setImage(asset) {
    return Image.asset(
      asset,
      height: 120,
    );
  }

  addDescription(desc) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        desc,
        textAlign: TextAlign.justify,
        style: TextStyle(fontFamily: this.descFontFamily, color: Colors.black),
      ),
    );
  }

  addWidget(widget) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Container(child: widget),
    );
  }

  addGroup(groupTitle) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
      child: Text(
        groupTitle,
        textAlign: TextAlign.justify,
        style:
            TextStyle(fontFamily: this.listTextFontFamily, color: Colors.grey),
      ),
    );
  }

  addItemWidget(image, title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 10, left: 10, bottom: 10),
      child: Row(
        children: [
          image,
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 10),
            child: Text(
              title,
              textAlign: TextAlign.justify,
              style: TextStyle(fontFamily: this.listTextFontFamily),
            ),
          ),
        ],
      ),
    );
  }

  addEmail(email) {
    return InkWell(
      onTap: () {
        _launchURL("mailto:$email");
      },
      child: addItemWidget(Icon(Icons.email), "Contact us"),
    );
  }

  addWebsite(param) {
    return InkWell(
        onTap: () {
          _launchURL(param);
        },
        child: addItemWidget(
            FaIcon(
              FontAwesomeIcons.globe,
              color: Color(0xff3b5998),
            ),
            "Visit our Website"));
  }

  addFacebook(param) {
    return InkWell(
        onTap: () {
          _launchURL("http://www.facebook.com/");
        },
        child: addItemWidget(
            FaIcon(
              FontAwesomeIcons.facebookSquare,
              color: Color(0xff3b5998),
            ),
            "Like on Facebook"));
  }

  addTwitter(param) {
    return InkWell(
        onTap: () {
          _launchURL("http://www.twitter.com/");
        },
        child: addItemWidget(
            FaIcon(
              FontAwesomeIcons.twitterSquare,
              color: Colors.blue,
            ),
            "Follow us on Twitter"));
  }

  addYoutube(param) {
    return InkWell(
        onTap: () {
          _launchURL("https://youtube.com/@halimahamid3175/");
        },
        child: addItemWidget(
            FaIcon(
              FontAwesomeIcons.youtube,
              color: Colors.red,
            ),
            "Watch us on Youtube"));
  }

  addPlayStore(param) {
    return InkWell(
        onTap: () {
          _launchURL("https://play.google.com/store/apps/");
        },
        child: addItemWidget(
            FaIcon(
              FontAwesomeIcons.googlePlay,
              color: Color(0xff02c3f7),
            ),
            "Rate us on Playstore"));
  }

  addGithub(param) {
    return InkWell(
        onTap: () {
          _launchURL("https://github.com/$param");
        },
        child: addItemWidget(
            FaIcon(
              FontAwesomeIcons.github,
              color: Colors.black,
            ),
            "Fork us on GitHub"));
  }

  addInstagram(param) {
    return InkWell(
        onTap: () {
          _launchURL("https://www.instagram.com/");
        },
        child: addItemWidget(
            FaIcon(
              FontAwesomeIcons.instagram,
              color: Color(0xffe20f27),
            ),
            "Follow us on Instagram"));
  }

  _launchURL(_url) async {
    try {
      await launch(_url);
    } catch (ex) {
      print(ex.toString());
    }
  }
}
