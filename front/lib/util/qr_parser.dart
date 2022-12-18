import 'package:front/util/logger.dart';

//https://aa.com/#/slot/AAAAAA to /slot/AAAAAA
String qrParse(String url) {
  final parsed = url.split('#');
  if (parsed.length == 2) {
    return parsed[1];
  } else {
    logger.e('QRコードの形式が不正です');
    return '';
  }
}
