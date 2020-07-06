import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

final counterProvider = StateProvider((ref) => 0);
final titleProvider = Provider((ref) => 'Hello Viktor, push the button');

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: Home(),
      ),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Count(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterProvider.read(context).state++,
        child: Icon(Icons.plus_one),
      ),
    );
  }
}

class Count extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final count = useProvider(counterProvider).state;
    final title = useProvider(titleProvider);
    return Text('$title: $count');
  }
}