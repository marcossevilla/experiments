import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

class LoginProvider with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool _loggedIn = true;

  bool get isLoggedIn => _loggedIn;

  // login() {
  //   // var user = _loginWithGoogle();

  //   if (user != null) {
  //     _loggedIn = true;
  //     notifyListeners();
  //   } else {
  //     _loggedIn = false;
  //     notifyListeners();
  //   }
  // }

  logout() {
    _loggedIn = false;
    notifyListeners();
  }

  // Future _loginWithGoogle() async {
  //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;
  // }
}
