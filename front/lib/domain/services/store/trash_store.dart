import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:front/domain/model/trash_model.dart';
import 'package:front/domain/services/store/store.dart';

class TrashStore {
  final FireStore fireStore;
  TrashStore({required this.fireStore});
  Future<void> uploadTrash(TrashModel trash) async {
    fireStore.addArray('users', FirebaseAuth.instance.currentUser!.uid,
        'trashLogIds', [trash.trashId]);
    fireStore
        .addArray('trashBoxes', trash.trashBoxId, 'trashIds', [trash.trashId]);
    fireStore.updateData('trash', trash.toJson(), document: trash.trashId);
  }
}
