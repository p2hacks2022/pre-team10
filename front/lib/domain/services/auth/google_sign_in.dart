// Googleを使ってサインイン
import 'package:google_sign_in/google_sign_in.dart';

Future<GoogleSignInAuthentication?> getAuthFromGoogle() async {
  final _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  // 認証フローのトリガー
  print("google sign in $_googleSignIn");
  final googleUser = await _googleSignIn.signIn();
  print(googleUser);
  // リクエストから、認証情報を取得
  return await googleUser?.authentication;
}
