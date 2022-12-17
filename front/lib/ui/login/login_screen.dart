import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:front/domain/services/store/user_store.dart';
import 'package:front/ui/widgets/google_sign_in_button/google_sign_in_button.dart';
import 'package:front/util/logger.dart';
import 'package:front/util/preview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key, required this.onResult});
  final void Function(bool) onResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: GoogleSignInButton(
          onPressed: (credential) async {
            if (credential != null) {
              onResult(true);
              ref.read(userStoreProvider).signInUser(credential.user!.uid);
              context.router.removeLast();
            } else {
              onResult(false);
            }
          },
        ),
      ),
    );
  }
}

void main() {
  preview(LoginScreen(
    onResult: (p0) {},
  ));
}
