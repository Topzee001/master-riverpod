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

// final names = [
//   "Khadijah",
//   "Bob",
//   "Charlie",
//   "Diana",
//   "Ethan",
//   "Fiona",
//   "George",
//   "Hannah",
//   "Isaac",
//   "Julia",
//   "Kevin",
//   "Lily",
// ];

// // ticker provider
// final tickerProvider = StreamProvider(
//   (ref) => Stream.periodic(const Duration(seconds: 1), (name) => name + 1),
// );

// // for name provider
// final nameProvider = StreamProvider(
//   (ref) =>
//       ref.watch(tickerProvider.stream).map((count) => names.getRange(0, count)),
// );

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final names = ref.watch(nameProvider);
//     return Scaffold(
//       appBar: AppBar(centerTitle: true, title: const Text('StreamProvider')),
//       body: names.when(
//         data: (names) {
//           return ListView.builder(
//             itemCount: names.length,
//             itemBuilder: (context, index) {
//               return ListTile(title: Text(names.elementAt(index)));
//             },
//           );
//         },
//         error:
//             (error, stackTrace) => const Text('Reached the end of the list!'),
//         loading: () => const Center(child: CircularProgressIndicator()),
//       ),
//     );
//   }
// }
