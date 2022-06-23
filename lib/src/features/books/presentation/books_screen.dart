import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../auth/presentation/auth_controller.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({
    Key? key,
    required GoogleSignInAccount? currentUser,
  })  : _currentUser = currentUser,
        super(key: key);

  final GoogleSignInAccount? _currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(_currentUser?.displayName ?? ""),
          ),
          const Text('Signed in successfully.'),
          const ElevatedButton(
            onPressed: handleSignOut,
            child: Text('SIGN OUT'),
          ),
        ],
      ),
    );
  }
}
