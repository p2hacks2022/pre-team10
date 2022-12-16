import 'dart:math';

import 'package:flutter/cupertino.dart';
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
      endCallback?.value = true;
    }
  }

  void setEndCallback(ValueNotifier<bool> callback) {
    endCallback = callback;
  }

  void setStopIndex(int index, {int reelIndex = 0}) {
    stopIndex[reelIndex] = index;
    //全部Trueなら
    if (!flags.contains(false)) {
      if (stopIndex[0] == stopIndex[1] && stopIndex[1] == stopIndex[2]) {
        final audio = AudioPlayer();
        audio.setUrl('assets/atari.mp3');
        audio.setVolume(0.2);
        audio.play();
        end = true;
      } else {
        double randam = Random().nextDouble();
        if (randam < chance) {
          //TODO チャンスオン
          hit = true;
        } else {
          final audio = AudioPlayer();
          audio.setUrl('assets/button.mp3');
          audio.setVolume(1.0);
          audio.play();
        }
      }
    } else {
      final audio = AudioPlayer();
      audio.setUrl('assets/button.mp3');
      audio.setVolume(1.0);
      audio.play();
    }
  }

  void restart() {
    flags = [false, false, false];
    stopIndex = [-1, -1, -1];
    restartCount--;
  }
}
