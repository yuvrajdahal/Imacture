import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imacture/core/presentations/routes/app_router.dart';

class AppWidget extends ConsumerWidget {
  final appRouter = AppRouter();
  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Gooddhan",
      routerConfig: appRouter.config(),
      theme: ThemeData(
        fontFamily: 'Arial',
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
