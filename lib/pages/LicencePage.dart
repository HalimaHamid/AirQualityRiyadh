import 'package:flutter/material.dart';

class LicencePage extends StatelessWidget {
  const LicencePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: AboutListTile(
          icon: Icon(Icons.insert_page_break_rounded),
          applicationIcon: Icon(Icons.insert_page_break_rounded),
          applicationName: "License",
          applicationVersion: "1.0.2",
          applicationLegalese: "here are the legalese",
          aboutBoxChildren: [
            Text("License of SMAQ"),
            //
            Text(
                "All rights reserved. No part of this application may be copy,  , or developed  in any form or by any means, without the prior written permission of the publisher, uses permitted by copyright law. For permission requests, write to the publisher, addressed " +
                    "Attention: Permissions Coordinator," +
                    " at the address below.halimahamid443@gmail.com")
          ],
        ),
      ),
    );
  }
}
