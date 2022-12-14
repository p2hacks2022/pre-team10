String qrParse(String url) {
  final uri = Uri.parse(url);
  final path = uri.path;
  final pathList = path.split('/');
  if (pathList.length > 2) {
    return pathList[2];
  }
  return '';
}
