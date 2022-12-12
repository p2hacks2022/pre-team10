import 'package:flutter/material.dart';
import 'package:front/domain/services/auth/google_sign_in.dart';
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
          // Googleから許しを得る；；
          final auth = await getAuthFromGoogle();
          if (auth != null) {
            logger.d("google sign in success");
          } else {
            logger.w("google sign in failed");
          }
          // ゆるされたらFirebaseにサインイン
        },
        child: Text("Googleでサインイン"));
  }
}

void main() {
  preview(const GoogleSignInButton());
}
