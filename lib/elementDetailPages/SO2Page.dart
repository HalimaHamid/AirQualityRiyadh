import 'package:flutter/material.dart';

class SO2 extends StatelessWidget {
  const SO2({Key? key}) : super(key: key);

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
                Text("SO2"),
                SizedBox(height: 20,),
                Image.asset("assets/so2.png"),
                SizedBox(height: 30,),
                Text(style: TextStyle(fontSize: 20),textAlign: TextAlign.center,"Sulphur Dioxide (SO2) is a corrosive acid gas which combines with water vapor in the atmosphere to produce acid rain. Both wet and dry deposition have been implicated in the damage and destruction of vegetation and in the degradation of soils, building materials and watercourses. S02 in ambient air is also associated with asthma and chronic bronchitis.")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
