// Googleを使ってサインイン
import 'package:google_sign_in/google_sign_in.dart';

final _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
  ],
);
Future<GoogleSignInAuthentication?> getAuthFromGoogle() async {
  // 認証フローのトリガー
  final googleUser = await _googleSignIn.signIn();
  // リクエストから、認証情報を取得
  return await googleUser?.authentication;
}
