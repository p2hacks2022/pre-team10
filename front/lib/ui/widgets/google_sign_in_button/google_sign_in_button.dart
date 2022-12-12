import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:front/domain/services/auth/firebase_sign_in.dart';
import 'package:front/ini.dart';
import 'package:front/util/logger.dart';
import 'package:front/util/preview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoogleSignInButton extends HookConsumerWidget {
  final double height;
  final Function(UserCredential?) onPressed;
  const GoogleSignInButton(
      {Key? key, this.height = 50, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: height,
      child: SignInButton(
        Buttons.Google,
        onPressed: () async {
          // googleを使ってFirebaseにサインイン
          await firebaseSignInWithGoogle();
          if (FirebaseAuth.instance.currentUser != null) {
            logger.d("firebase sign in success");
          } else {
            logger.w("firebase sign in failed");
          }
        },
      ),
    );
  }
}

void main() {
  ini();
  preview(Scaffold(
    body: GoogleSignInButton(
      onPressed: (_) {},
    ),
  ));
}
