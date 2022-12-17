import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front/domain/services/auth/auth_state_provider.dart';
import 'package:front/domain/services/store/store.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:front/util/hex_parser.dart';
import 'package:front/util/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pointycastle/asymmetric/api.dart';

import '../../../ini.dart';

class RsaStoreImpl implements RsaStore {
  RsaStoreImpl(this.fireStore);
  late final String privateKey;
  final FireStore fireStore;

  //寝たい
  RSAAsymmetricKey parseKeyFromString(String key) {
    //\\nを改行に変換

    key = key.replaceAll('\\n', "\n");
    logger.d(key);

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

  Future<String> getPrivateKey() async {
    final data = await fireStore.getData('secret');
    final private = data[0]['private'];
    return private;
  }

  Future<void> setPrivateKey() async {
    privateKey = await getPrivateKey();
  }

  @override
  String decrypt(String encryptedHex) {
    return decryptRSA(encryptedHex, privateKey);
  }
}

abstract class RsaStore {
  final FireStore fireStore;
  RsaStore(this.fireStore);
  String decrypt(String encryptedHex);
}

class MockRsaStore implements RsaStore {
  @override
  FireStore get fireStore => throw UnimplementedError();

  @override
  String decrypt(String encryptedHex) {
    // TODO: implement decrypt
    throw UnimplementedError();
  }
}

class RsaStoreStateNotifier extends StateNotifier<RsaGuarder> {
  RsaStoreStateNotifier(this.fireStore, this.user) : super(RsaGuarder()) {
    getPrivateKey();
  }
  final FireStore fireStore;
  final User? user;
  Future<void> getPrivateKey() async {
    logger.d(user?.uid);
    if (user != null) {
      final RsaStoreImpl rsaStore = RsaStoreImpl(fireStore);
      await rsaStore.setPrivateKey();

      state = state.copyWith(loading: false, rsaStore: rsaStore);
    }
  }
}

final rsaStoreProvider =
    StateNotifierProvider<RsaStoreStateNotifier, RsaGuarder>(
  (ref) => RsaStoreStateNotifier(
    ref.read(fireStoreProvider),
    ref.watch(firebaseUserProvider),
  ),
);

class RsaGuarder {
  bool loading = true;
  RsaStore rsaStore = MockRsaStore();
  RsaGuarder copyWith({bool? loading, RsaStore? rsaStore}) {
    return RsaGuarder()
      ..loading = loading ?? this.loading
      ..rsaStore = rsaStore ?? this.rsaStore;
  }
}
