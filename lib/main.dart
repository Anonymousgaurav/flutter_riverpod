import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


void main() {
  runApp(
    const ProviderScope(child: MyApp())
  );
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

/// Using [ConsumerWidget], this allows the widget tree to listen to changes on provider, so that
/// the UI automatically updates when needed.

/// First and foremost, before reading a provider, we need to obtain a "ref" object.
/// This object is what allows us to interact with providers.
final currentDate = Provider<DateTime>((ref)=> DateTime.now());

/// final myProvider, the declaration of a variable.
/// This variable is what we will use in the future to read the state of our provider.
/// Providers should always be final.
class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  /// An object that allows widgets to interact with providers.
  /// Returns the value exposed by a provider and rebuild the widget when that

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    /// watching the changes
    final dateTime = ref.watch(currentDate);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hooks Riverpod"),
      ),
      body: Center(
        child: Text(
          dateTime.toIso8601String()
        ),
      ),
    );
  }
}
