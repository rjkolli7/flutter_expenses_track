import 'package:components/components.dart';
import 'package:coremodules/src/bindings/app_bindings.dart';
import 'package:coremodules/src/route/app_pages.dart';
import 'package:firebase_integration/firebase_integration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoreMain {
  Future initCore() async {
    await ExpensesTrackFirebase.initializeFirebase();
    CoreBindings().dependencies();
    easyLoadingConfig();
  }
}

class ExpensesTrackApp extends StatelessWidget {
  const ExpensesTrackApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      logWriterCallback: Logger.write,
      title: 'Expense Tracker',
      builder: initEasyLoading(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.splash,
      getPages: AppPages.routes,
    );
  }
}
