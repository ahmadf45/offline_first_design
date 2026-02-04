import 'dart:async';

import 'package:flutter/material.dart';
import 'package:offline_first_design/infrastructures/app_components.dart';
import 'package:offline_first_design/infrastructures/misc/utils.dart';
import './infrastructures/misc/router.dart' as custom_router;
import 'infrastructures/misc/pages.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      Future.wait([_initFabric(), AppComponents.init()]).then((_) {
        runApp(MyApp()); // run app
      });
    },
    ((error, stackTrace) {
      debugPrint('NOTIF ERROR\nDETAIL: $error\nSTACKTRACE: $stackTrace');
    }),
  );
}

Future<void> _initFabric() async {
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  final custom_router.Router _router;

  MyApp({super.key}) : _router = custom_router.Router();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Utils.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
      title: '100 Days with Flutter',
      onGenerateRoute: (settings) {
        return _router.getRoute(settings);
      },
      initialRoute: Pages.home,
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top),
          child: child,
        );
      },
    );
  }
}
