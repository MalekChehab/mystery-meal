import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChanged => _firebaseAuth.authStateChanges().map(
      (User user) => user?.uid,
  );

  //Email & Password Sign up
  Future<String> createUserWithEmailAndPassword(String email, String password, String name) async{
    final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password
    );
    //update the username
    // var userUpdateInfo = UserUpdateInfo();
    // userUpdateInfo.displayName = name;
    // await currnetUser.updateProfile(userUpdateInfo);
    // await currnetUser.reload();
    // return currnetUser.uid;
    // updateName(name, currentUser);
  }

  Future updateName(String name, User firebaseUser) async {
    firebaseUser.updateProfile(displayName: name);
    await firebaseUser.reload();
  }
}