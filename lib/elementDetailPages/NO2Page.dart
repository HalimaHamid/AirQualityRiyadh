import 'package:flutter/material.dart';

class NO2 extends StatelessWidget {
  const NO2({Key? key}) : super(key: key);

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
                Text("NO2"),
                SizedBox(height: 20,),
                Image.asset("assets/Screen Shot 2023-02-13 at 4.37.01 PM.png"),
                SizedBox(height: 30,),
                Text(style: TextStyle(fontSize: 20),textAlign: TextAlign.center,"Nitrogen dioxide is the chemical compound with the formula NO 2. It is one of several nitrogen oxides. NO 2 is an intermediate in the industrial synthesis of nitric acid, millions of tons of which are produced each year. At higher temperatures it is a reddish- brown gas that has a characteristic sharp")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
