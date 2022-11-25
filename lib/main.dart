import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class Counter extends StateNotifier<int> {
  /// default value will be null
  Counter() : super(1);

  void increment() => state = state == null ? 1 : state + 1;

  ///TODO: use ???
   int get value => state;

  void decrement() => state = state == null ? 1 : state + 1;
}

final counterProvider = StateNotifierProvider<Counter, int>((ref) => Counter());

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (context,ref,child){
            final count = ref.watch(counterProvider);
            final text = count == 1 ? "Press the button" : count.toString();
            return Text(text);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
              onPressed: ref.read(counterProvider.notifier).increment,
              child: const Text("Increment Counter")),

        ],
      ),
    );
  }
}
