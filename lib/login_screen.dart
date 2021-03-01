import 'package:flutter/material.dart';
import 'package:httpreq/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page'), centerTitle: true),
      body: Column(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Card(
              color: Colors.black.withOpacity(0.7),
              child: Column(
                children: [
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Username',
                              hintText: 'Enter your name...',
                              hintStyle: TextStyle(color: Colors.grey),
                              labelStyle: TextStyle(color: Colors.deepPurple),
                            ),
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter your password...',
                              hintStyle: TextStyle(color: Colors.grey),
                              labelStyle: TextStyle(color: Colors.deepPurple),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  MaterialButton(
                    onPressed: () {
                      Constants.prefs.setBool('loggedIn', true);
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Text('Login'),
                    textColor: Colors.white,
                    color: Colors.deepPurpleAccent,
                    padding: EdgeInsets.all(20),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Container(child: Image.asset('assets/images/wallpic.png')),
        ],
      ),
    );
  }
}
