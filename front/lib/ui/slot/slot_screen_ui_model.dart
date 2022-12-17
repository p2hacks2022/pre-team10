import 'package:front/domain/model/trash_model.dart';
import 'package:front/ui/slot/slot_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final slotScreenModelProvider =
    StateProvider((ref) => TrashModel(createdAt: DateTime.now()));
