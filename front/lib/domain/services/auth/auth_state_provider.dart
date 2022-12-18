import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseUserStream = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final firebaseUserProvider = Provider<User?>((ref) {
  final firebaseUser = ref.watch(firebaseUserStream);
  return firebaseUser.value;
});
