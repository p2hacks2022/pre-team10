import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:front/util/hex_parser.dart';
import 'package:pointycastle/asymmetric/api.dart';

RSAAsymmetricKey parseKeyFromString(String key) {
  final parser = RSAKeyParser();
  return parser.parse(key);
}

String decryptRSA(String encryptedHex, String privateKey) {
  final key = parseKeyFromString(privateKey) as RSAPrivateKey;
  final encrypter = Encrypter(RSA(privateKey: key));
  final parsedHex = bytesString2Uint8List(encryptedHex);
  final encrypted = Encrypted(parsedHex);
  return encrypter.decrypt(encrypted);
}
