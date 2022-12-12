import 'package:flutter/material.dart';
import 'package:front/domain/services/auth/google_sign_in.dart';
import 'package:front/util/preview.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GoogleSignInButton extends HookConsumerWidget {
  GoogleSignInButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
        onPressed: () async {
          final auth = await getAuthFromGoogle();
        },
        child: Text("Googleでサインイン"));
  }
}

void main() {
  preview(GoogleSignInButton());
}
