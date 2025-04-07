// lib/screens/edit_manga_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/database.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditMangaScreen extends ConsumerStatefulWidget {
  final Manga manga;

  const EditMangaScreen({super.key, required this.manga});

  @override
  ConsumerState<EditMangaScreen> createState() => _EditMangaScreenState();
}

class _EditMangaScreenState extends ConsumerState<EditMangaScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _genreController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.manga.title);
    _genreController = TextEditingController(text: widget.manga.genre);
    _descriptionController = TextEditingController(text: widget.manga.description);
  }

  Future<void> _updateManga(BuildContext context) async {
    final db = ref.read(databaseProvider);
    await db.updateManga(
      widget.manga.id,
      _titleController.text,
      _genreController.text,
      _descriptionController.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Manga updated!")),
    );
    Navigator.pop(context); // Go back after updating
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Manga"),
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
              onPressed: () => _updateManga(context),
              child: const Text("Update Manga"),
            ),
          ],
        ),
      ),
    );
  }
}