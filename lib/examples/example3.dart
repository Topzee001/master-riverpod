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

// enum City { london, newYork, tokyo, moscow, beijing }

// typedef WeatherEmoji = String;

// Future<WeatherEmoji> getWeather(City city) {
//   return Future.delayed(
//     Duration(seconds: 1),
//     () =>
//         {
//           City.beijing: "🌤️",
//           City.london: "🌧️",
//           City.moscow: "❄️",
//         }[city]!, //the provider will handle the error for any state with no weather
//     // if wanted tobe handled here for the null
//     // instead of the '!' use ?? 'error value'
//   );
// }

// // will be changed by the UI, UI writes to and read from this
// final currentCityProvider = StateProvider<City?>((ref) => null);

// const unknownWeatherEmiji = '🤷🏽‍♂️';

// // UI reads this
// final weatherProvider = FutureProvider<WeatherEmoji>((ref) {
//   final city = ref.watch(currentCityProvider);
//   if (city != null) {
//     return getWeather(city);
//   } else {
//     return unknownWeatherEmiji;
//   }
// });

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentweather = ref.watch(weatherProvider);
//     return Scaffold(
//       appBar: AppBar(centerTitle: true, title: const Text('Weather')),

//       body: Column(
//         children: [
//           currentweather.when(
//             data: (data) => Text(data, style: const TextStyle(fontSize: 40)),
//             error:
//                 (_, __) =>
//                     const Text('Error 😥', style: TextStyle(fontSize: 40)),
//             loading:
//                 () => Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: const CircularProgressIndicator(),
//                 ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: City.values.length,
//               itemBuilder: (context, index) {
//                 final city = City.values[index];
//                 final isSelected = city == ref.watch(currentCityProvider);
//                 return ListTile(
//                   title: Text(city.toString()),
//                   trailing: isSelected ? const Icon(Icons.check) : null,
//                   onTap:
//                       () => ref.read(currentCityProvider.notifier).state = city,
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
