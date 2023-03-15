import 'package:flutter/material.dart';

class O3 extends StatelessWidget {
  const O3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Riyadh Air Quality"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Column(
              children: [
                Text("Ozone O3"),
                SizedBox(
                  height: 18,
                ),
                Image.asset("assets/o3.png"),
                SizedBox(
                  height: 30,
                ),
                Text(
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                    "Ozone (03) is not emitted directly into the atmosphere, but is a secondary pollutant produced by reaction between nitrogen dioxide (NO2), hydrocarbons and sunlight. Whereas nitrogen dioxide (NO2) acts as a source of ozone, nitrogen oxide (NO) destroys ozone acting as a local sink. For this reason, ozone levels are not as high in urban areas (where high levels of NO are emitted from vehicles) as in rural areas. Ozone levels are usually highest in rural areas, particularly in hot, still, sunny weather conditions giving rise to summer smog.")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
