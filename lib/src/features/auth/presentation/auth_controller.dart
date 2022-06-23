import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn googleSignIn = GoogleSignIn();
Future<void> handleSignIn() async {
  try {
    await googleSignIn.signIn();
  } catch (error) {
    // print(error);
  }
}

Future<void> handleSignOut() => googleSignIn.disconnect();

class AuthController extends StatelessWidget {
  late final GoogleSignInAccount? currentUser;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
