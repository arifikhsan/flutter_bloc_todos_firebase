import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc_todos_firebase/src/domain/repository/user_repository.dart';

class FirebaseUserRepository implements UserRepository {
  final FirebaseAuth _firebaseAuth;

  FirebaseUserRepository({FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override
  Future<void> authenticate() {
    return _firebaseAuth.signInAnonymously();
  }

  @override
  Future<String> getUserId() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser.uid;
  }

  @override
  Future<bool> isAuthenticated() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }
}
