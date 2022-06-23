import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../books/presentation/books_screen.dart';
import 'auth_controller.dart';
import 'login_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
// _handleGetContact(_currentUser!);
      }
    });
    googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUser != null) {
      return BooksScreen(currentUser: _currentUser);
    } else {
      return const LoginScreen();
    }
  }
}
