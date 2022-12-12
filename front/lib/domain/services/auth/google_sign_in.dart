// Googleを使ってサインイン
import 'package:google_sign_in/google_sign_in.dart';

Future signInWithGoogle() async {
  // 認証フローのトリガー
  final googleUser = await GoogleSignIn(scopes: [
    'email',
  ]).signIn();
  // リクエストから、認証情報を取得
}
