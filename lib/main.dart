import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/screens/splash/intro.dart';
import 'package:xlo_mobx/services/api.dart';
import 'package:xlo_mobx/stores/login.dart';
import 'package:xlo_mobx/stores/page.dart';
import 'package:xlo_mobx/stores/user_manager.dart';
import 'package:xlo_mobx/themes/light.dart';

void main() async {
  setupLocators();
  await Api.instance.initServer();
  runApp(
    XloCloneApp(),
  );
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(LoginStore());
  GetIt.I.registerSingleton(UserManagerStore());
}

class XloCloneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO Clone',
      theme: AppLightTheme(),
      home: Splash(),
    );
  }
}
