import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:front/domain/model/trash_model.dart';
import 'package:front/util/base64.dart';
import 'package:front/util/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThanksScreen extends HookConsumerWidget {
  final String? base64TrashModel;
  //final TrashModel? trashModel;
  ThanksScreen({@PathParam("trash") this.base64TrashModel, super.key});
  // : trashModel = base64TrashModel != null
  //       ? TrashModel.fromJson(fromBase64Json(base64TrashModel))
  //       : null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logger.i(base64TrashModel);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanks'),
      ),
      body: Center(
        child: TextButton(onPressed: () {}, child: Text('Thanks')),
      ),
    );
  }
}
