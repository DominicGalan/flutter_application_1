// lib/screens/manga_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/database.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/editmanga.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MangaListScreen extends ConsumerStatefulWidget {
  const MangaListScreen({super.key});

  @override
  ConsumerState<MangaListScreen> createState() => _MangaListScreenState();
}

class _MangaListScreenState extends ConsumerState<MangaListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Manga> _mangaList = [];
  List<Manga> _filteredMangaList = [];

  @override
  void initState() {
    super.initState();
    _loadManga();
  }

  Future<void> _loadManga() async {
    final db = ref.read(databaseProvider);
    final manga = await db.getAllManga();
    setState(() {
      _mangaList = manga;
      _filteredMangaList = manga; // Initially show all manga
    });
  }

  void _filterManga(String query) {
    setState(() {
      _filteredMangaList = _mangaList.where((manga) {
        return manga.title.toLowerCase().contains(query.toLowerCase()) ||
            manga.genre.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manga List"),
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
              onChanged: _filterManga,
            ),
          ),
          Expanded(
            child: _filteredMangaList.isEmpty
                ? const Center(child: Text("No manga found."))
                : ListView.builder(
                  itemCount: _filteredMangaList.length,
                  itemBuilder: (context, index) {
                    final manga = _filteredMangaList[index];
                    return ListTile(
                      title: Text(manga.title),
                      subtitle: Text(manga.genre),
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
                                        builder: (context) => EditMangaScreen(manga: manga),
                                      ),
                                    ).then((_) => _loadManga()); // Reload data after editing
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () async {
                                    final db = ref.read(databaseProvider);
                                    await db.deleteManga(manga.id);
                                    _loadManga(); // Reload data after deletion
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