import 'package:flutter/material.dart';
import 'package:smaq/elementDetailPages/COPage.dart';
import 'package:smaq/elementDetailPages/NO2Page.dart';
import 'package:smaq/elementDetailPages/O3Page.dart';
import 'package:smaq/elementDetailPages/pm2.5.dart';
import 'package:smaq/elementDetailPages/SO2Page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Button List',
      home: ButtonList(),
    );
  }
}

class ButtonList extends StatelessWidget {
  final List<String> buttonTexts = ['CO', 'NO2', 'O3', 'PM2.5', 'SO2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Air Quality Index'),
      ),
      body: ListView.builder(
        itemCount: buttonTexts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: InkWell(
              onTap: () {
                switch (buttonTexts[index]) {
                  case 'CO':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CO()),
                    );
                    break;
                  case 'NO2':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NO2()),
                    );
                    break;
                  case 'O3':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => O3()),
                    );
                    break;
                  case 'PM2.5':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PM25()),
                    );
                    break;
                  case 'SO2':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SO2()),
                    );
                    break;
                }
              },
              child: Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        buttonTexts[index],
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//
// class ButtonList extends StatelessWidget {
//   final List<String> buttonTexts = ['CO', 'NO2', 'O3', 'PM2.5', 'SO2'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Air Quality Index'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(buttonTexts.length, (index) {
//             return ElevatedButton(
//               child: Text(buttonTexts[index]),
//               onPressed: () {
//                 switch (buttonTexts[index]) {
//                   case 'CO':
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => CO()),
//                     );
//                     break;
//                   case 'NO2':
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => NO2()),
//                     );
//                     break;
//                   case 'O3':
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => O3()),
//                     );
//                     break;
//                   case 'PM2.5':
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => PM25()),
//                     );
//                     break;
//                   case 'SO2':
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SO2()),
//                     );
//                     break;
//                 }
//               },
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
//
// class COPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('CO Page'),
//       ),
//       body: Center(
//         child: Text('This is the CO page!'),
//       ),
//     );
//   }
// }
//
// class NO2Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('NO2 Page'),
//       ),
//       body: Center(
//         child: Text('This is the NO2 page!'),
//       ),
//     );
//   }
// }
//
// class O3Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('O3 Page'),
//       ),
//       body: Center(
//         child: Text('This is the O3 page!'),
//       ),
//     );
//   }
// }
//
// class PM2_5Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PM2.5 Page'),
//       ),
//       body: Center(
//         child: Text('This is the PM2.5 page!'),
//       ),
//     );
//   }
// }

// class SO2Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('SO2 Page'),
//       ),
//       body: Center(
//         child: Text('This is the SO2 page!'),
//       ),
//     );
//   }
// }
