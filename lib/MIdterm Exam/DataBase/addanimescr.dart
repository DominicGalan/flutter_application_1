// lib/screens/add_anime_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddAnimeScreen extends ConsumerStatefulWidget {
  const AddAnimeScreen({super.key});

  @override
  _AddAnimeScreenState createState() => _AddAnimeScreenState();
}

class _AddAnimeScreenState extends ConsumerState<AddAnimeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _addAnime(BuildContext context) async {
    final db = ref.read(databaseProvider);
    await db.addAnime(
      _titleController.text,
      _genreController.text,
      _descriptionController.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Anime added successfully!")),
    );
    Navigator.pop(context); // Close the screen after adding
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Anime")),
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
              onPressed: () => _addAnime(context),
              child: const Text("Add Anime"),
            ),
          ],
        ),
      ),
    );
  }
}