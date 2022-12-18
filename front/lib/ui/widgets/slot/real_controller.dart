import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:front/util/logger.dart';
import 'package:just_audio/just_audio.dart';

class ReelController {
  //遠隔するクラス
  List<bool> flags = [false, false, false];
  List<int> stopIndex = [-1, -1, -1];
  bool hit;
  ReelController(
    this.hit,
    this.restartCount,
  );
  ValueNotifier<bool>? endCallback;
  int restartCount;
  double chance = 0.3;
  bool end = false;
  void stop(
    int index,
  ) {
    flags[index] = true;
    if (!flags.contains(false)) {
      logger.wtf(endCallback);
      endCallback?.value = true;
    }
  }

  void setEndCallback(ValueNotifier<bool> callback) {
    endCallback = callback;
  }

  Future<void> play({required String path, double volume = 1.0}) async {
    final audio = AudioPlayer();
    audio.setUrl(path);
    audio.setVolume(volume);
    await audio.play();
  }

  void setStopIndex(int index, {int reelIndex = 0}) {
    stopIndex[reelIndex] = index;
    //全部Trueなら
    if (!flags.contains(false)) {
      if (stopIndex[0] == stopIndex[1] && stopIndex[1] == stopIndex[2]) {
        play(
            path:
                'https://www.sansei-rd.co.jp/products04/garo_goldstorm/contents/se-download/sounds/garo_se05_gzanbaken.mp3',
            volume: 0.1);
        end = true;
      } else {
        double random = Random().nextDouble();
        if (random < chance) {
          play(
              path:
                  'https://www.sansei-rd.co.jp/products04/garo_goldstorm/contents/se-download/sounds/garo_se01_garohoryu.html',
              volume: 0.1);
          hit = true;
        } else {
          play(
              path: 'https://soundeffect-lab.info/sound/button/mp3/beep2.mp3',
              volume: 1.0);
        }
      }
    } else {
      play(
          path: 'https://soundeffect-lab.info/sound/button/mp3/beep2.mp3',
          volume: 1.0);
    }
  }

  void restart() {
    flags = [false, false, false];
    stopIndex = [-1, -1, -1];
    restartCount--;
  }
}
