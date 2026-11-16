import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'auth_service.dart';
import '../home/home_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  late final Stream<User?> _authStateChanges;

  @override
  void initState() {
    super.initState();
    _authStateChanges = FirebaseAuth.instance.authStateChanges();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text(
                'Something went wrong. Please restart Nexora.',
              ),
            ),
          );
        }

        if (snapshot.hasData) {
          return HomeScreen(
            onLogout: () async {
              await AuthService().signOut();
            },
          );
        }

        return const LoginScreen();
      },
    );
  }
}
