import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../util/logger.dart';

class FireStoreImpl implements FireStore {
  // 寝たい
  //データを読み込む
  final firestore = FirebaseFirestore.instance;
  @override
  Future<List<Map<String, dynamic>>> getData(String collection,
      {String doc = ""}) async {
    logger.d(firestore.collection(collection).path);
    final snap = await firestore.collection(collection).get();

    List<Map<String, dynamic>> list = [];
    for (var element in snap.docs) {
      if (doc == "") {
        list.add(element.data());
      } else {
        if (element.id == doc) {
          list.add(element.data());
        }
      }
    }
    return list;
  }

  //データをストリームで読み込む
  @override
  Stream<List<Map<String, dynamic>>> streamData(String collection) {
    return firestore.collection(collection).snapshots().map((event) {
      List<Map<String, dynamic>> list = [];
      for (var element in event.docs) {
        list.add(element.data());
      }
      return list;
    });
  }

  @override
  Future<String> updateData(String collection, Map<String, dynamic> data,
      {String document = ""}) async {
    if (document == "") {
      //dataをaddしたらdocumentのIDを返す
      final doc = await firestore.collection(collection).add(data);
      return doc.id;
    } else {
      logger.e(document);
      await firestore.collection(collection).doc(document).set(data);
      return document;
    }
  }

  @override
  addArray(String collection, String document, String array,
      List<dynamic> data) async {
    await firestore
        .collection(collection)
        .doc(document)
        .update({array: FieldValue.arrayUnion(data)});
  }

  @override
  removeArray(
      String collection, String document, String array, dynamic data) async {
    await firestore.collection(collection).doc(document).update({
      array: FieldValue.arrayRemove([data])
    });
  }
}

abstract class FireStore {
  Future<List<Map<String, dynamic>>> getData(String path, {String doc = ""});
  Stream<List<Map<String, dynamic>>> streamData(String path);
  Future<String> updateData(String collection, Map<String, dynamic> data,
      {String document = ""});
  Future<void> addArray(
      String collection, String document, String array, List<dynamic> data);
  Future<void> removeArray(
      String collection, String document, String array, dynamic data);
}

final fireStoreProvider = Provider<FireStore>((ref) {
  return FireStoreImpl();
});
