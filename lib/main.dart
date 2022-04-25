import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app_module.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter/foundation.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  //TODO: remove HttpOverrides on production
  HttpOverrides.global = MyHttpOverrides();

  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://7a4642b56784428bb60a265f7e9526ba@o1144940.ingest.sentry.io/6209545';
      options.tracesSampleRate = 1.0;
      options.tracesSampler = (samplingContext) {
        // return a number between 0 and 1 or null (to fallback to configured value)
      };
    },
    appRunner: () => runApp(ModularApp(module: AppModule(), child: const AppWidget())),
  );

  //  initializeDateFormatting().then((_) => runApp(ModularApp(module: AppModule(), child: const AppWidget())));
  // return runApp(ModularApp(module: /*<MainModule>*/, child: /*<MainWidget>*/));
}

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Wait',
      theme: ThemeData(fontFamily: 'Quicksand'),
      navigatorObservers: [SentryNavigatorObserver()],
    ).modular();
  }
}
