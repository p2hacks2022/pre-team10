import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../util/logger.dart';
import 'google_sign_in.dart';

Future<UserCredential?> firebaseSignInWithGoogle() async {
  // Googleを使ってサインイン
  final auth = await getAuthFromGoogle();
  if (auth != null) {
    logger.d("google sign in success");
  } else {
    logger.w("google sign in failed");
  }
  if (auth != null) {
    // サインインに成功したら、Firebaseにサインイン
    final credential = GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    if (userCredential.user != null) {
      logger.d("firebase sign in success");
    } else {
      logger.w("firebase sign in failed\nit may be caused by firebase's bug");
    }
    return userCredential;
  }
  return null;
}
