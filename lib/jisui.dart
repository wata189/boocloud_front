import 'package:flutter/material.dart';

class Jisui extends StatelessWidget {
  const Jisui({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Jisui"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Jisuiページです',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}