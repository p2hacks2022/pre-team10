import 'package:firebase_auth/firebase_auth.dart';
import 'package:front/domain/model/coupon_model.dart';
import 'package:front/domain/model/trash_box_model.dart';
import 'package:front/domain/services/store/store.dart';
import 'package:front/ui/widgets/coupon/coupon_widget_model.dart';
import 'package:front/util/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class CouponStore {
  Future<CouponWidgetModel> getCouponWidgetModel(String couponId);
  Future<CouponModel> getCouponModel(String couponId);
  Stream<Future<List<CouponWidgetModel>>> streamCouponWidgetModels(
      List<String> ids);
}

class CouponStoreImpl implements CouponStore {
  final FireStore _fireStore;
  CouponStoreImpl({required FireStore fireStore}) : _fireStore = fireStore;

  @override
  Future<CouponWidgetModel> getCouponWidgetModel(String couponId) async {
    final data = await getCouponModel(couponId);
    logger.wtf("data: ${data.toJson()}");
    final boxId = data.trashBoxId;
    final boxData = await _fireStore.getData('trashBoxes', doc: boxId);
    final TrashBoxModel boxModel = TrashBoxModel.fromJson(boxData[0]);
    return CouponWidgetModel(shopName: boxModel.boxName, couponModel: data);
  }

  @override
  Stream<Future<List<CouponWidgetModel>>> streamCouponWidgetModels(
      List<String> ids) {
    final data = _fireStore.streamData('coupons');
    return data.map((event) async {
      final List<CouponWidgetModel> models = [];
      for (final id in ids) {
        final model = await getCouponWidgetModel(id);
        models.add(model);
      }
      return models;
    });
  }

  @override
  Future<CouponModel> getCouponModel(String couponId) async {
    final data = await _fireStore.getData('coupons', doc: couponId);
    return CouponModel.fromJson(data[0]);
  }
}

final couponStoreProvider = Provider<CouponStore>((ref) {
  return CouponStoreImpl(fireStore: ref.watch(fireStoreProvider));
});
