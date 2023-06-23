import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quote_generator/features/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quote_generator/features/shared/shared.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Stream<User?> authStateChanges() async* {
    yield* FirebaseAuth.instance.authStateChanges();
  }

  @override
  Future<AuthResult> googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      Constants.emailScope,
    ]);
    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      return AuthResult.aborted;
    }

    final googleAuth = await signInAccount.authentication;
    final oauthCredentials = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    try {
      final result = await FirebaseAuth.instance.signInWithCredential(
        oauthCredentials,
      );

      await _usersCollectionRef().doc(result.user?.uid).set({
        FirebaseFieldName.displayName: result.user?.displayName,
        FirebaseFieldName.email: result.user?.email,
        FirebaseFieldName.userId: result.user?.uid,
        FirebaseFieldName.imageUrl: result.user?.photoURL,
      });

      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }
  }

  @override
  Future<void> googleSignOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  CollectionReference _usersCollectionRef() {
    return FirebaseFirestore.instance.collection(
      FirebaseCollectionName.users,
    );
  }
}
