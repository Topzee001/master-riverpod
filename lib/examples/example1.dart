// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       themeMode: ThemeMode.dark,
//       darkTheme: ThemeData.dark(),
//       home: const HomePage(),
//     );
//   }
// }

// final currentDate = Provider((ref) => DateTime.now());

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final date = ref.watch(currentDate);
//     return Scaffold(
//       appBar: AppBar(title: Text('Hooks Riverpod')),
//       body: Center(child: Text(date.toIso8601String())),
//     );
//   }
// }
