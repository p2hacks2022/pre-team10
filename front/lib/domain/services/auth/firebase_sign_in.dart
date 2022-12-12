import 'package:firebase_auth/firebase_auth.dart';

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
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  return null;
}
