import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/config/router.dart';
import 'package:frontend/config/state_handler.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    FutureBuilder<StateHandler>(
      future: StateHandler.initStateHandler(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: background1,
            child: const CircularProgressIndicator(),
          );
        }
        return ChangeNotifierProvider.value(
          value: snapshot.data,
          child: const Loader(),
        );
      },
    ),
  );
}

class Loader extends StatelessWidget {
  const Loader({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: globalRouter,
    );
  }
}
