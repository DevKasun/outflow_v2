import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _authService = FirebaseAuth.instance;

  Future<void> signupWithEmailAndPassword(
    String emailAddress,
    String password,
  ) async {
    try {
      final credential = await _authService.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginWithEmailAndPassword(
    String emailAddress,
    String password,
  ) async {
    try {
      final credential = await _authService.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Stream<User?> get authStateChanges => _authService.authStateChanges();

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
