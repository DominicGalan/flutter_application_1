// lib/screens/anime_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/database.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/editanime.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimeListScreen extends ConsumerStatefulWidget {
  const AnimeListScreen({super.key});

  @override
  ConsumerState<AnimeListScreen> createState() => _AnimeListScreenState();
}

class _AnimeListScreenState extends ConsumerState<AnimeListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Anime> _animeList = [];
  List<Anime> _filteredAnimeList = [];

  @override
  void initState() {
    super.initState();
    _loadAnime();
  }

  Future<void> _loadAnime() async {
    final db = ref.read(databaseProvider);
    final anime = await db.getAllAnime();
    setState(() {
      _animeList = anime;
      _filteredAnimeList = anime; // Initially show all anime
    });
  }

  void _filterAnime(String query) {
    setState(() {
      _filteredAnimeList = _animeList.where((anime) {
        return anime.title.toLowerCase().contains(query.toLowerCase()) ||
            anime.genre.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anime List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: _filterAnime,
            ),
          ),
          Expanded(
            child: _filteredAnimeList.isEmpty
                ? const Center(child: Text("No anime found."))
                : ListView.builder(
                    itemCount: _filteredAnimeList.length,
                    itemBuilder: (context, index) {
                      final anime = _filteredAnimeList[index];
                      return ListTile(
                        title: Text(anime.title),
                        subtitle: Text(anime.genre),
                        trailing: ref.watch(loggedInProvider)
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditAnimeScreen(anime: anime),
                                        ),
                                      ).then((_) => _loadAnime()); // Reload data after editing
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () async {
                                      final db = ref.read(databaseProvider);
                                      await db.deleteAnime(anime.id);
                                      _loadAnime(); // Reload data after deletion
                                    },
                                  ),
                                ],
                              )
                            : null,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}