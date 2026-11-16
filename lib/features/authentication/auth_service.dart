import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Login with email and password
  Future<User?> signIn({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential.user;
  }

  // Register a new user
  Future<User?> register({
    required String email,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return credential.user;
  }

  // Logout
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Current logged-in user
  User? get currentUser => _auth.currentUser;
}