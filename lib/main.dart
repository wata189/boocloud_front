import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'jisui.dart';

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Jisui(),
    ),
    GoRoute(
      path: '/jisui',
      builder: (context, state) => const Jisui(),
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade900),
      ),
      routerConfig: _router,
    );
  }
}

