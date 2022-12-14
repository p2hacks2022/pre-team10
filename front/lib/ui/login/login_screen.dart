import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:front/ui/widgets/google_sign_in_button/google_sign_in_button.dart';
import 'package:front/util/logger.dart';
import 'package:front/util/preview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: GoogleSignInButton(
          onPressed: (credential) {
            if (credential != null) {
              logger.i(credential.user);
              context.router.pop<bool>(true);
            }
          },
        ),
      ),
    );
  }
}

void main() {
  preview(const LoginScreen());
}
