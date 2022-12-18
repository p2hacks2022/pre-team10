import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:front/ui/widgets/coupon/coupon_widget.dart';
import 'package:front/util/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/services/store/user_store.dart';

class MainScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coupons = ref.watch(userCouponProvider);
    logger.wtf("coupons: $coupons");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
      ),
      body: Stack(
        children: [
          Center(
            child: ListView.builder(
              itemCount: coupons.length,
              itemBuilder: (context, index) {
                return Slidable(
                  child: CouponWidget(
                      coupons[index].shopName, coupons[index].couponModel),
                  endActionPane: ActionPane(
                    motion: ScrollMotion(),
                    children: [
                      SlidableAction(
                        // An action can be bigger than the others.
                        flex: 2,
                        onPressed: (BuildContext context) async {
                          await ref.watch(userStoreProvider).removeCoupon(
                              coupons[index].couponModel.couponId);
                        },

                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: '消す',
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 4),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const FittedBox(
                    fit: BoxFit.fill,
                    child: Icon(Icons.qr_code_scanner),
                  ),
                  onPressed: () async {
                    await context.router.pushNamed("/qr");
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
