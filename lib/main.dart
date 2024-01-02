import 'package:flutter/material.dart';
import 'package:forms_app/config/router/app_router.dart';
import 'package:forms_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      // AQUI YA NO SE USA EL HOME PORQUE TODO ESTA
      // DADO BASADO EN EL ROUTER
      /*
      home: const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),*/
    );
  }
}
