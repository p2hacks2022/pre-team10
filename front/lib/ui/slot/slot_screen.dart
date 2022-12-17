import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:encrypt/encrypt.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:front/domain/model/trash_box_model.dart';
import 'package:front/domain/services/store/rsa_store.dart';
import 'package:front/domain/services/store/trash_store.dart';
import 'package:front/ui/slot/slot_screen_ui_model.dart';
import 'package:front/ui/widgets/slot/reel_widget.dart';
import 'package:front/util/logger.dart';
import 'package:front/util/preview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/model/trash_model.dart';
import '../../domain/services/store/store.dart';
import '../widgets/slot/real_controller.dart';

class SlotScreen extends HookConsumerWidget {
  const SlotScreen({@PathParam('trash') this.encrypted, super.key});
  final String? encrypted;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (encrypted == null) {
      context.router.pop();
    }
    final rsaStoreGuard = ref.watch(rsaStoreProvider);
    final trashBoxModelProvider = ref.watch(slotScreenModelProvider);
    final TrashBoxModelController = ref.watch(slotScreenModelProvider.notifier);
    return !rsaStoreGuard.loading
        ? SlotContent(
            encrypted!, rsaStoreGuard.rsaStore, TrashBoxModelController)
        : Container();
  }
}

class SlotContent extends HookConsumerWidget {
  SlotContent(this.encrypted, this.rsaStore, this.controller, {super.key});
  final RsaStore rsaStore;
  final String encrypted;
  final StateController<TrashModel> controller;
  final TrashStore trashStore = TrashStore(fireStore: FireStoreImpl());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String decrypted;
    useEffect(() {
      decrypted = rsaStore.decrypt(encrypted);
      logger.i("decrypted: $decrypted");
      final demap = json.decode(decrypted);

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        controller.state = controller.state.copyWith(
            count: int.parse(demap['count']),
            trashBoxId: demap['trashBoxId'],
            trashId: demap['trashId'],
            userId: FirebaseAuth.instance.currentUser!.uid);
        trashStore.uploadTrash(controller.state);
      });
    }, []);

    return ReelWidget(ReelController(true, controller.state.count)); //実装を絶対読むな
  }
}

void main() {
  preview(
    const SlotScreen(
      encrypted:
          "62a464a53844a625a3e20e2114c5ea05932056005fe32458418a2d2ea25f15348369320bb94f3b09b223d5b4ff7a0febe9d3a92a3656696afe2009ed639ae155409416274175ab11be7114547538504ce97f5cea042fdbb025534f056600ec4a58567e2f41f1e3c0c831f978cd7eaa298e27a95016f521251a6ac6a42c6ebcdf682f7876d530fe130ebc02167f67dd3efd2a4872577f5fc3f6909b9d64e8e9d5e17a58c8194ed37cc9df7ab6314984614563957835b0cd34526b91035693cf645454da79baedfbb1dbc80aa5da29da5c4447898eb2fce362cd73e489bbe3cb68c4bc8dffb02aa16d79686a958678909484e6c44c7398c9445278da606f4043d1",
    ),
  );
}
