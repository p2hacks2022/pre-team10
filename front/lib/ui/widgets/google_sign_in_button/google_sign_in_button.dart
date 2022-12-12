import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:front/domain/services/auth/firebase_sign_in.dart';
import 'package:front/domain/services/auth/google_sign_in.dart';
import 'package:front/ini.dart';
import 'package:front/util/logger.dart';
import 'package:front/util/preview.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoogleSignInButton extends HookConsumerWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
        onPressed: () async {
          // googleを使ってFirebaseにサインイン
          await firebaseSignInWithGoogle();
          if (FirebaseAuth.instance.currentUser != null) {
            logger.d("firebase sign in success");
          } else {
            logger.w("firebase sign in failed");
          }
        },
        child: Text("Googleでサインイン"));
  }
}

void main() {
  ini();
  preview(const GoogleSignInButton());
}
