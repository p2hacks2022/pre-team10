import 'package:front/util/logger.dart';

String qrParse(String url) {
  final uri = Uri.parse(url);
  final path = uri.path;
  logger.i('url path is ${path}');
  final pathList = path.split('/');
  if (pathList.length > 2) {
    return pathList[2];
  }
  return '';
}
