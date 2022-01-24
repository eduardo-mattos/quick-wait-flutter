import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quick_wait_android/app_module.dart';

void main() {
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
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
        title: 'Number Trivia',).modular();
  }
}