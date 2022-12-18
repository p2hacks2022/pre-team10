import 'dart:typed_data';

List<int> bytesString2ListInt(String bytesString) {
  final a = <int>[];
  for (var i = 0; i < bytesString.length; i += 2) {
    a.add(int.parse(bytesString.substring(i, i + 2), radix: 16));
  }
  return a;
}

Uint8List bytesString2Uint8List(String bytesString) {
  final a = bytesString2ListInt(bytesString);
  return Uint8List.fromList(a);
}
