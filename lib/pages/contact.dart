import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  final textControllerName = TextEditingController();
  final textControllerEmail = TextEditingController();
  final textControllerPhone = TextEditingController();
  final textControllerTitle = TextEditingController();
  final textControllerMessage = TextEditingController();

  String _name = '';
  String _email = '';
  String _phone = '';
  String _title = '';
  String _content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                TextFormField(
                  controller : textControllerName,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller : textControllerEmail,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller : textControllerPhone,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    hintText: 'Enter your phone number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phone = value!;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller : textControllerTitle,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    hintText: 'Enter the title of your message',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title for your message';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value!;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller : textControllerMessage,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Message',
                    hintText: 'Enter your message',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _content = value!;
                  },
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Send the message using the values in _name, _email, _phone, _title, and _content

                        // Store the contact information to local drive
                        SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                        prefs.setString('name', _name);
                        prefs.setString('email', _email);
                        prefs.setString('phone', _phone);
                        prefs.setString('title', _title);
                        prefs.setString('content', _content);
                        clearText();
                      }
                    },
                    child: Container(
                        height: 50,
                        width: double.maxFinite,
                        child: Center(child: Text('Submit'))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clearText() {
    print("clear_____");

    textControllerName.clear();
    textControllerEmail.clear();
    textControllerPhone.clear();
    textControllerTitle.clear();
    textControllerMessage.clear();
  }
}