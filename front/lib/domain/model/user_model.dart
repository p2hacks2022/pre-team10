import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @Default("%void%") String userId,
    @Default([]) List<String> trashLogIds,
    @Default([]) List<String> couponIds,
  }) = _UserModel;
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

class UserStateNotifier extends StateNotifier<UserModel> {
  UserStateNotifier(
    UserModel state,
  ) : super(state);
  void update(UserModel user) {
    state = user;
  }
}

final userStateNotifierProvider =
    StateNotifierProvider<UserStateNotifier, UserModel>((ref) {
  UserModel user = const UserModel();
  user = user.copyWith(
    userId: FirebaseAuth.instance.currentUser!.uid,
  );
  return UserStateNotifier(user);
});
