import 'package:firebase_auth/firebase_auth.dart';
import 'package:front/domain/model/user_model.dart';
import 'package:front/domain/services/store/store.dart';

class UserStore {}

class UserStoreImpl implements UserStore {
  final FireStore _fireStore;
  UserStoreImpl({required FireStore fireStore}) : _fireStore = fireStore;
  //クーポン
  Future<void> addCoupon(String couponId) async {
    _fireStore.addArray('users', FirebaseAuth.instance.currentUser!.uid,
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
