import 'package:flutter/material.dart';
import 'package:todowebapp/api/google_sign_in_api.dart';
import 'package:todowebapp/pages/homepage.dart';

import 'package:todowebapp/pages/newfile.dart';
import 'package:todowebapp/widgets/signinwithgooglebutton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState(); 
    // Check if the user is already logged in
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    final user = await GoogleSignInApi.currentUser();
    if (user != null) {
      // User is already logged in, navigate to LoggedInPage
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => FoodAppHome()),
      );
    }
  }
  
  Future signIn() async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Sign in Failed"),
      ));
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BottomNavigationDemo(user: user)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(000000),
              Color(14213),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login time 👋',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                ),
              ),
              Text(
                "Use your google account to login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 30,),
              GoogleBtn1(onPressed: () {
                signIn();
              })
            ],
          ),
        ),
      ),
    );
  }
}
