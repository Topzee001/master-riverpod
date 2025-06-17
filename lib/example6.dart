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
  final bool isFavorite;

  const Film({
    required this.id,
    required this.title,
    required this.description,
    required this.isFavorite,
  });
  Film copy({required bool isFavorite}) {
    return Film(
      id: id,
      title: title,
      description: description,
      isFavorite: isFavorite,
    );
  }

  @override
  String toString() =>
      'Film(id: $id, title: $title, description: $description, isFavorite: $isFavorite)';

  @override
  bool operator ==(covariant Film other) {
    return id == other.id && isFavorite == other.isFavorite;
  }

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hashAll([id, isFavorite]);
}

const allFilms = [
  Film(
    id: '1',
    title: 'Inception',
    description: 'A mind-bending thriller about dream invasion.',
    isFavorite: false,
  ),
  Film(
    id: '2',
    title: 'The Matrix',
    description: 'A hacker discovers the truth about his reality.',
    isFavorite: false,
  ),
  Film(
    id: '3',
    title: 'Interstellar',
    description: 'Explorers travel through a wormhole in space.',
    isFavorite: false,
  ),
  Film(
    id: '4',
    title: 'The Dark Knight',
    description: 'Batman faces the Joker in Gotham City.',
    isFavorite: false,
  ),
];

class FilmNotifier extends StateNotifier<List<Film>> {
  FilmNotifier() : super(allFilms);

  void update(Film film, bool isFavorite) {
    state =
        state
            .map(
              (thisFilm) =>
                  thisFilm.id == film.id
                      ? thisFilm.copy(isFavorite: isFavorite)
                      : thisFilm,
            )
            .toList();
  }
}

enum FavoriteStatus { all, favorite, notFavorite }

final FavotriteStatusProvider = StateProvider<FavoriteStatus>(
  (_) => FavoriteStatus.all,
);
//  all films
final allFilmsProvider = StateNotifierProvider<FilmNotifier, List<Film>>(
  (_) => FilmNotifier(),
);

// favorite films
final favoriteFilmsProvider = Provider<Iterable<Film>>(
  (ref) => ref.watch(allFilmsProvider).where((film) => film.isFavorite),
);

// not favorite films
final notFavoriteFilmsProvider = Provider<Iterable<Film>>(
  (ref) => ref.watch(allFilmsProvider).where((film) => !film.isFavorite),
);

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
      appBar: AppBar(centerTitle: true, title: const Text('Films')),
      body: Column(
        children: [
          FilterWidget(),
          Consumer(
            builder: (context, ref, child) {
              final filter = ref.watch(FavotriteStatusProvider);
              switch (filter) {
                case FavoriteStatus.all:
                  return FilmsList(provider: allFilmsProvider);
                case FavoriteStatus.favorite:
                  return FilmsList(provider: favoriteFilmsProvider);
                case FavoriteStatus.notFavorite:
                  return FilmsList(provider: notFavoriteFilmsProvider);
              }
            },
          ),
        ],
      ),
    );
  }
}

class FilmsList extends ConsumerWidget {
  final AlwaysAliveProviderBase<Iterable<Film>> provider;
  const FilmsList({required this.provider, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final films = ref.watch(provider);
    return Expanded(
      child: ListView.builder(
        itemCount: films.length,
        itemBuilder: (context, index) {
          final film = films.elementAt(index);
          final favoriteIcon =
              film.isFavorite
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border);
          return ListTile(
            title: Text(film.title),
            subtitle: Text(film.description),
            trailing: IconButton(
              onPressed: () {
                final isFavorite = !film.isFavorite;
                ref.read(allFilmsProvider.notifier).update(film, isFavorite);
              },
              icon: favoriteIcon,
            ),
          );
        },
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return DropdownButton(
          value: ref.watch(FavotriteStatusProvider),
          items:
              FavoriteStatus.values
                  .map(
                    (fs) => DropdownMenuItem(
                      value: fs,
                      child: Text(fs.toString().split('.').last),
                    ),
                  )
                  .toList(),
          //  onChanged: (FavoriteStatus ? fs){ # or he below
          onChanged: (fs) {
            ref.read(FavotriteStatusProvider.state).state = fs!;
          },
        );
      },
    );
  }
}
