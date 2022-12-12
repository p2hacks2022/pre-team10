import 'package:flutter/material.dart';
import 'package:front/ui/main/main_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../ui/login/login_screen.dart';

void preview(Widget child) {
  runApp(ProviderScope(child: MaterialApp(home: child)));
}
