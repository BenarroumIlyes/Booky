import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

GoogleSignIn _googleSignIn = GoogleSignIn();
Future<void> _handleSignIn() async {
  try {
    await _googleSignIn.signIn();
  } catch (error) {
    // print(error);
  }
}

Future<void> _handleSignOut() => _googleSignIn.disconnect();

class _AuthScreenState extends State<AuthScreen> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
// _handleGetContact(_currentUser!);
      }
    });
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUser != null) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text(_currentUser?.displayName ?? ""),
            ),
            const Text('Signed in successfully.'),
            const ElevatedButton(
              onPressed: _handleSignOut,
              child: Text('SIGN OUT'),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text('You are not currently signed in.'),
            ElevatedButton(
              onPressed: _handleSignIn,
              child: Text('SIGN IN'),
            ),
          ],
        ),
      );
    }
  }
}
