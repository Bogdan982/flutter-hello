import 'package:flutter/material.dart';

void main() {
  runApp(const HelloApp());
}

class HelloApp extends StatelessWidget {
  const HelloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Привет, Flutter!',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  String _greeting = 'Привет!\nНажми на кнопку';

  void _sayHello() {
    final name = _controller.text.trim();
    setState(() {
      _greeting = name.isNotEmpty
          ? 'Привет, $name!'
          : 'Ну введи имя хотя бы';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Моё Flutter приложение')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _greeting,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Введи своё имя',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            FilledButton(
              onPressed: _sayHello,
              child: const Text('Поздороваться'),
            ),
          ],
        ),
      ),
    );
  }
}
