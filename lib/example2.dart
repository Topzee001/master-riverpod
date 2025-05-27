// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// // infix operator for addition on num types
// extension OptionalInfinixAddition<T extends num> on T? {
//   T? operator +(T? other) {
//     final shadow = this;
//     if (shadow != null) {
//       return shadow + (other ?? 0) as T;
//     } else {
//       return null;
//     }
//   }
// }

// // generics for addition on num types
// class Counter extends StateNotifier<int?> {
//   Counter() : super(null);
//   void increment() {
//     state = state == null ? 1 : state + 1;
//   }

//   // int? get value => state;
// }

// final counterProvider = StateNotifierProvider<Counter, int?>(
//   (ref) => Counter(),
// );

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

// // void testIt() {
// //   final int? int1 = 5;
// //   final int? int2 = null;

// //   final result = int1 + int2;

// //   print(result);
// // }

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Consumer(
//           builder: (context, ref, child) {
//             final count = ref.watch(counterProvider);
//             final text = count == null ? 'press the button' : count.toString();
//             return Text(text);
//           },
//         ),
//       ),

//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           TextButton(
//             onPressed: () {
//               ref.read(counterProvider.notifier).increment();
//             },
//             child: Text('increment counter'),
//           ),
//         ],
//       ),
//     );
//   }
// }
