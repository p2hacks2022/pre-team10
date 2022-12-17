import 'dart:math';

void main() {
  // 半径
  final r = 2;

  // 角度(deg)
  final theta = 45 * pi / 180;
  print('theta: $theta');
  // 円の接線の傾き
  final slope = 1 / tan(theta);
  print('slope: $slope');

  //radをdegに変換
  final deg = (slope * 180 / pi);
  print('deg: $deg');
}
