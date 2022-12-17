import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:front/util/preview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/model/coupon_model.dart';

class CouponWidget extends HookConsumerWidget {
  final CouponModel couponModel;
  final String shopName;

  const CouponWidget(this.shopName, this.couponModel, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Colors.amberAccent,
      child: ListTile(
        title: Text(
          "${shopName}:${couponModel.discount}% off",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        textColor: Colors.red,
      ),
    );
  }
}

void main() {
  preview(Scaffold(
      body: Center(
    child: CouponWidget("未来屋", CouponModel()),
  )));
}
