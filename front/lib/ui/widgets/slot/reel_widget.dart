import 'dart:math';
import 'dart:ui' as ui;

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front/domain/services/store/user_store.dart';
import 'package:front/ui/widgets/slot/real_controller.dart';
import 'package:front/util/logger.dart';
import 'package:funvas/funvas.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class ReelCanvas extends Funvas {
  //寝たい寝寝寝寝寝寝
  double omega = 250; //角速度
  final Size size;
  final List<String> items;
  late final itemsLength = items.length;
  final ReelController controller;
  ReelCanvas(this.items, this.controller, this.size, this.reelIndex);
  double theta0 = 90;
  late final double h = 674; //高さ
  final double w = 370; //幅
  final double padding = 10; //余白
  late final double r = items.length * h / 2 / pi; //半径
  late final double randomTheta = 0;

  //late final double r = 75; //半径
  double headX(double theta) => cos(theta) * r; //headの座標
  double headY(double theta) => sin(theta) * r + r - h * 0.75;
  double getSlope(double theta) => theta; //傾き
  double getRad(double theta) => theta * pi / 180; //角度をラジアンに変換
  double getTheta(double t) => (theta0 + omega * t); //時間による角度の変化
  List<ui.Image> itemsImage = [];
  double temp = 0;
  final int reelIndex;
  var delta = 0.0;
  @override
  void u(double t) async {
    c.scale(0.3);
    if (itemsImage.isEmpty && t == 0) {
      //非同期処理なのでt==0で初期化
      loadImages(items).then((value) => itemsImage = value);
    }
    c.drawRect(Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = Colors.black); //背景
    List<double> thetaList = [];
    for (var i = 0; i < itemsLength; i++) {
      if (itemsImage.length != itemsLength) {
        break;
      }
      var theta = getRad(getTheta(t) + 360 / itemsLength * i) + randomTheta;
      final slope = getSlope(theta);

      if (controller.flags[reelIndex]) {
        //logger.i('stop');
        theta = temp + 2 * pi / itemsLength * i;
        thetaList.add(theta % (2 * pi));
      } else if (i == 0) {
        temp = theta;
      }
      if ((theta - getRad(theta0 * 1)) % (2 * pi) < pi) {
        continue;
      }
      c.save();
      c.translate(0, headY(theta));
      c.translate(0, h / 2);
      final mat = Matrix4.rotationX(slope);
      c.transform(mat.storage);
      c.translate(0, -h / 2);
      //画像が大きいので縮小
      c.drawImageRect(itemsImage[i], Rect.fromLTWH(0, 0, w, h),
          Rect.fromLTWH(0, 0, w, h), Paint());
      c.restore();
    }
    // 止まった柄のインデックスを取得
    // 0<=theta<2pi
    if (controller.flags[reelIndex]) {
      if (controller.hit) {
        if (controller.stopIndex[reelIndex] == -1) {
          temp = 6 * 2 * pi / itemsLength + pi / 4;
          controller.setStopIndex(6, reelIndex: reelIndex);
        }
      } else {
        var min = 2 * pi;
        var index = 0;

        for (var i = 0; i < thetaList.length; i++) {
          if (min > thetaList[i] - randomTheta) {
            min = thetaList[i];
            delta = -thetaList[i];
            index = i;
          } else if (min > (2 * pi - thetaList[i] - randomTheta)) {
            min = 2 * pi - thetaList[i];
            delta = 2 * pi - thetaList[i];
            index = i;
          }
        }
        if (controller.stopIndex[reelIndex] == -1) {
          temp = index * 2 * pi / itemsLength + pi / 4;
          controller.setStopIndex(index, reelIndex: reelIndex);
        }
      }
    }
  }
}

class ReelWidget extends HookConsumerWidget {
  final ReelController controller;

  List<String> items = [
    'assets/slot1.png',
    'assets/slot2.png',
    'assets/slot3.png',
    'assets/slot4.png',
    'assets/slot5.png',
    'assets/slot6.png',
    'assets/slot7.png',
    'assets/slot8.png',
    'assets/slot9.png',
  ];
  final size = const Size(370, 1000);
  final String trashBoxId;
  ReelWidget(this.controller, this.trashBoxId, {super.key});

  late final canvas = [
    ReelCanvas(items, controller, size, 0),
    ReelCanvas(items, controller, size, 1),
    ReelCanvas(items, controller, size, 2),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final endCallback = useState(false);
    useEffect(() {
      controller.setEndCallback(endCallback);
      logger.i(controller.endCallback);
      return;
    }, [controller]);
    final canvas0 = canvas[0];
    final canvas1 = canvas[1];
    final canvas2 = canvas[2];
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                width: 370 * 0.3,
                height: 1000 * 0.3,
                child: FunvasContainer(
                  funvas: canvas0,
                ),
              ),
              SizedBox(
                width: size.width * 0.3,
                child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          final v = controller.stop(0);
                          logger.wtf(controller.endCallback);
                        },
                        child: Text('stop'))),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: 370 * 0.3,
                height: 1000 * 0.3,
                child: FunvasContainer(
                  funvas: canvas1,
                ),
              ),
              SizedBox(
                width: size.width * 0.3,
                child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          controller.stop(1);
                        },
                        child: Text('stop'))),
              )
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: 370 * 0.3,
                height: 1000 * 0.3,
                child: FunvasContainer(
                  funvas: canvas2,
                ),
              ),
              SizedBox(
                width: size.width * 0.3,
                child: Center(
                    child: ElevatedButton(
                        onPressed: () {
                          controller.stop(2);
                        },
                        child: Text('stop'))),
              )
            ],
          )
        ],
      ),
      if (endCallback.value)
        Center(
          child: TextButton(
              onPressed: () async {
                if (controller.end) {
                  logger.wtf("you are win");
                  final couponId =
                      await ref.watch(userStoreProvider).addCoupon(trashBoxId);
                  await context.router.replaceNamed('/thanks/${couponId}');
                } else if (controller.restartCount > 0) {
                  controller.restart();
                } else {
                  context.router.replaceNamed('/');
                }
              },
              child: Text("次")),
        )
    ]);
  }
}

//pathからui.Imageを取得する
//眠い
Future<ui.Image> loadImage(String path) async {
  final data = await rootBundle.load(path);
  final codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
  final frame = await codec.getNextFrame();
  return frame.image;
}

Future<List<ui.Image>> loadImages(List<String> paths) async {
  final images = <ui.Image>[];
  logger.wtf(paths);
  for (var path in paths) {
    final image = await loadImage(path);
    images.add(image);
  }
  return images;
}
