import 'package:flutter/material.dart';
import 'package:front/ui/tools/preview.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoogleSignInButton extends HookConsumerWidget {
  GoogleSignInButton({Key? key}) : super(key: key);
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
        onPressed: () async {
          await _googleSignIn.signIn();
        },
        child: Text("Googleでサインイン"));
  }
}

void main() {
  preview(GoogleSignInButton());
}
