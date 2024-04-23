import 'package:add/add.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:setting/setting.dart';

import 'screen.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: MaterialApp.router(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: Modular.routerConfig,
      ),
    );
  }
}

class AppModule extends Module {
  AppModule();

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const AppScreen(),
    );

    for (final Module import in imports) {
      import.routes(r);
    }
  }

  @override
  List<Module> get imports => [
        AddModule(),
        SettingModule(),
      ];
}
