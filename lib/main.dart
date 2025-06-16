import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

@immutable
class Film {
  final String id;
  final String title;
  final String description;
  final bool isFavourite;

  const Film({
    required this.id,
    required this.title,
    required this.description,
    required this.isFavourite,
  });
  Film copy({required bool isFavourite}) {
    return Film(
      id: id,
      title: title,
      description: description,
      isFavourite: isFavourite,
    );
  }

  @override
  String toString() =>
      'Film(id: $id, title: $title, description: $description, isFavourite: $isFavourite)';

  @override
  bool operator ==(covariant Film other) {
    return id == other.id && isFavourite == other.isFavourite;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hashAll([id, isFavourite]);
}

const allFilms = [
  Film(
    id: '1',
    title: 'Inception',
    description: 'A mind-bending thriller about dream invasion.',
    isFavourite: false,
  ),
  Film(
    id: '2',
    title: 'The Matrix',
    description: 'A hacker discovers the truth about his reality.',
    isFavourite: false,
  ),
  Film(
    id: '3',
    title: 'Interstellar',
    description: 'Explorers travel through a wormhole in space.',
    isFavourite: false,
  ),
  Film(
    id: '4',
    title: 'The Dark Knight',
    description: 'Batman faces the Joker in Gotham City.',
    isFavourite: false,
  ),
];

class FilmNotifier extends StateNotifier<List<Film>> {
  FilmNotifier() : super(allFilms);

  void update(Film film, bool isFavourite) {
    state =
        state
            .map(
              (thisFilm) =>
                  thisFilm.id == film.id
                      ? thisFilm.copy(isFavourite: isFavourite)
                      : thisFilm,
            )
            .toList();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Home Page')),
    );
  }
}
