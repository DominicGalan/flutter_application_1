// lib/screens/add_manga_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddMangaScreen extends ConsumerStatefulWidget {
  const AddMangaScreen({super.key});

  @override
  _AddMangaScreenState createState() => _AddMangaScreenState();
}

class _AddMangaScreenState extends ConsumerState<AddMangaScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _genreController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _addManga(BuildContext context) async {
    final db = ref.read(databaseProvider);
    await db.addManga(
      _titleController.text,
      _genreController.text,
      _descriptionController.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Manga added successfully!")),
    );
    Navigator.pop(context); // Close the screen after adding
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Manga")),
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
              onPressed: () => _addManga(context),
              child: const Text("Add Manga"),
            ),
          ],
        ),
      ),
    );
  }
}