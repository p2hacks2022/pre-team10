import 'dart:convert';

String toBase64(String input) {
  final bytes = utf8.encode(input);
  return base64Encode(bytes);
}

String fromBase64(String input) {
  final bytes = base64Decode(input);
  return utf8.decode(bytes);
}

Map<String, dynamic> fromBase64Json(String input) {
  final bytes = base64Decode(input);
  final json = utf8.decode(bytes);
  return jsonDecode(json);
}
