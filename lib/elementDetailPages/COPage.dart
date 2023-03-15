import 'package:flutter/material.dart';

class CO extends StatelessWidget {
  const CO({Key? key}) : super(key: key);

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
                Text("CO"),
                SizedBox(height: 20,),
                Image.asset("assets/co.png"),
                SizedBox(height: 30,),
                Text(style: TextStyle(fontSize: 20),textAlign: TextAlign.center,"Carbon Monoxide A colorless, odorless gas resulting from the incomplete combustion of hydrocarbon fuels, CO interferes with the blood's ability to carry oxygen to the body's tissues and results in adverse health effects.")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
