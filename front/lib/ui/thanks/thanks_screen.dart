import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front/domain/model/coupon_model.dart';
import 'package:front/domain/model/trash_model.dart';
import 'package:front/domain/services/store/coupon_store.dart';
import 'package:front/ui/widgets/coupon/coupon_widget.dart';
import 'package:front/ui/widgets/coupon/coupon_widget_model.dart';
import 'package:front/util/base64.dart';
import 'package:front/util/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThanksScreen extends HookConsumerWidget {
  final String? couponId;

  ThanksScreen({@PathParam("coupon") this.couponId, super.key});
  CouponWidgetModel? couponWidgetModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memo = useMemoized(() async {
      logger.w("couponId: $couponId");
      final couponStore = ref.watch(couponStoreProvider);
      final couponWidgetModel =
          await couponStore.getCouponWidgetModel(couponId ?? "");
      logger.wtf("couponWidgetModel: ${couponWidgetModel.toJson()}");
      return couponWidgetModel;
    });
    couponWidgetModel = useFuture(memo).data;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Thanks'),
        ),
        body: Center(
          child: Column(
            children: [
              Spacer(),
              Text("おめでとうございます！", style: TextStyle(fontSize: 30)),
              Text("クーポンをゲットしました！", style: TextStyle(fontSize: 30)),
              Padding(
                  padding: EdgeInsets.all(10),
                  child: CouponWidget(couponWidgetModel?.shopName ?? "",
                      couponWidgetModel?.couponModel ?? CouponModel())),
              TextButton(
                  onPressed: () {
                    context.router.replaceNamed('/');
                  },
                  child: Text("終わる")),
              Spacer(),
            ],
          ),
        ));
  }
}
