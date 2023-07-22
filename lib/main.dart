import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imacture/core/presentations/app_widget.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

void main() async {
  await dotenv.dotenv.load(fileName: ".env");

  runApp(ProviderScope(child: AppWidget()));
}

// class App extends ConsumerWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final helloworld = ref.watch(helloWorldProvider);
//     return Scaffold(
//         body: Column(
//       children: [ElevatedButton(onPressed: () => {}, child: Text("click"))],
//     ));
//   }
// }
// 54578D