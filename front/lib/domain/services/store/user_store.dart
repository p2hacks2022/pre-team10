import 'package:firebase_auth/firebase_auth.dart';
import 'package:front/domain/model/coupon_model.dart';
import 'package:front/domain/model/user_model.dart';
import 'package:front/domain/services/store/store.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../util/logger.dart';

abstract class UserStore {
  Future<void> signInUser(String uid);
  Future<void> addCoupon();
  Future<void> removeCoupon(String couponId);
  Future<List<String>> getCouponIds();
  Future<UserModel> getUserModel();
  Stream<UserModel> streamUserModel();
  Future<void> updateUserModel(UserModel userModel);
}

class UserStoreImpl implements UserStore {
  final FireStore _fireStore;
  UserStoreImpl({required FireStore fireStore}) : _fireStore = fireStore;
  Future<void> signInUser(String uid) async {
    final data = await _fireStore.getData('users');
    if (data.isEmpty) {
      logger.wtf(data);
      await _fireStore.updateData('users',
          UserModel(userId: uid, couponIds: [], trashLogIds: []).toJson(),
          document: uid);
    }
  }

  //クーポン
  Future<void> addCoupon() async {
    await _fireStore.updateData('coupons', const CouponModel().toJson());
    final couponId = await _fireStore.getData('coupons').then((value) =>
        value.lastWhere((element) => element['couponId'] != null)['couponId']);
    await _fireStore.addArray('users', FirebaseAuth.instance.currentUser!.uid,
        'couponIds', [couponId]);
  }

  Future<void> removeCoupon(String couponId) async {
    _fireStore.removeArray('users', FirebaseAuth.instance.currentUser!.uid,
        'couponIds', [couponId]);
  }

  Future<List<String>> getCouponIds() async {
    final data = await _fireStore.getData('users');
    return data
        .firstWhere((element) =>
            element['uid'] == FirebaseAuth.instance.currentUser!.uid)
        .cast<String, dynamic>()['couponIds'];
  }

  //ユーザModel
  Future<UserModel> getUserModel() async {
    final data = await _fireStore.getData('users');
    return UserModel.fromJson(data.firstWhere(
        (element) => element['uid'] == FirebaseAuth.instance.currentUser!.uid));
  }

  Stream<UserModel> streamUserModel() {
    return _fireStore.streamData('users').map((event) {
      return UserModel.fromJson(event.firstWhere((element) =>
          element['uid'] == FirebaseAuth.instance.currentUser!.uid));
    });
  }

  Future<void> updateUserModel(UserModel userModel) async {
    _fireStore.updateData('users', userModel.toJson(),
        document: FirebaseAuth.instance.currentUser!.uid);
  }
}

final userStoreProvider = Provider<UserStore>((ref) {
  return UserStoreImpl(fireStore: ref.watch(fireStoreProvider));
});
