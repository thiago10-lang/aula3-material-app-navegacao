import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício 02',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: Colors.white,
        canvasColor: Colors.lightBlue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ThemeData - Sobrescrita')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const ThemedBox(),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey.shade400,
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.yellow.shade200,
                ),
                child: const ThemedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThemedBox extends StatelessWidget {
  const ThemedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 90,
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        border: Border.all(color: Colors.orange),
      ),
      alignment: Alignment.center,
      child: const Text('Widget'),
    );
  }
}
