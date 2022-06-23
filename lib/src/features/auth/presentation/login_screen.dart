import 'package:flutter/material.dart';

import 'auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text('You are not currently signed in.'),
          ElevatedButton(
            onPressed: handleSignIn,
            child: Text('SIGN IN'),
          ),
        ],
      ),
    );
  }
}
