import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FireStoreImpl implements FireStore {
  // 寝たい
  //データを読み込む
  final firestore = FirebaseFirestore.instance;
  Future<List<Map<String, dynamic>>> getData(String collection) async {
    final snap = await firestore.collection(collection).get();
    List<Map<String, dynamic>> list = [];
    for (var element in snap.docs) {
      list.add(element.data());
    }
    return list;
  }

  //データをストリームで読み込む
  Stream<List<Map<String, dynamic>>> streamData(String collection) {
    return firestore.collection(collection).snapshots().map((event) {
      List<Map<String, dynamic>> list = [];
      for (var element in event.docs) {
        list.add(element.data());
      }
      return list;
    });
  }

  updateData(String collection, Map<String, dynamic> data,
      {String document = ""}) async {
    if (document == "") {
      await firestore.collection(collection).add(data);
    } else {
      await firestore.collection(collection).doc(document).update(data);
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
  Future<List<Map<String, dynamic>>> getData(String path);
  Stream<List<Map<String, dynamic>>> streamData(String path);
  updateData(String collection, Map<String, dynamic> data,
      {String document = ""});
  Future<void> addArray(
      String collection, String document, String array, List<dynamic> data);
  Future<void> removeArray(
      String collection, String document, String array, dynamic data);
}

final fireStoreProvider = Provider<FireStore>((ref) {
  return FireStoreImpl();
});
