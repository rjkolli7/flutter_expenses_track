import 'package:coremodules/coremodules.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CoreMain().initCore();
  runApp(const ExpensesTrackApp());
}
