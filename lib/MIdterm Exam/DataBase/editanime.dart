// lib/screens/edit_anime_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/database.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditAnimeScreen extends ConsumerStatefulWidget {
  final Anime anime;

  const EditAnimeScreen({super.key, required this.anime});

  @override
  ConsumerState<EditAnimeScreen> createState() => _EditAnimeScreenState();
}

class _EditAnimeScreenState extends ConsumerState<EditAnimeScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _genreController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.anime.title);
    _genreController = TextEditingController(text: widget.anime.genre);
    _descriptionController = TextEditingController(text: widget.anime.description);
  }

  Future<void> _updateAnime(BuildContext context) async {
    final db = ref.read(databaseProvider);
    await db.updateAnime(
      widget.anime.id,
      _titleController.text,
      _genreController.text,
      _descriptionController.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Anime updated!")),
    );
    Navigator.pop(context); // Go back after updating
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Anime"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: _genreController,
              decoration: const InputDecoration(labelText: "Genre"),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _updateAnime(context),
              child: const Text("Update Anime"),
            ),
          ],
        ),
      ),
    );
  }
}