import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi{
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  static Future logout() => _googleSignIn.disconnect();
  static Future<GoogleSignInAccount?> currentUser() async {
    return await _googleSignIn.isSignedIn() ? _googleSignIn.currentUser : null;
  }
}