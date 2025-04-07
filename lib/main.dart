import 'package:flutter/material.dart';
import 'package:flutter_application_1/MIdterm%20Exam/Admin/defadmin.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/addanimescr.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/addmangascr.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/database.dart';
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/provider.dart';
import 'package:flutter_application_1/MIdterm%20Exam/UI/NewUI%20Account/accountUI.dart';
import 'package:flutter_application_1/MIdterm%20Exam/UI/aboutme.dart';
import 'package:flutter_application_1/MIdterm%20Exam/UI/anime.dart';
import 'package:flutter_application_1/MIdterm%20Exam/UI/manga.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = DatabaseService();
  await db.initialize();

  initializeDefaultAdmin(db);

  runApp(
    ProviderScope(
      overrides: [
        databaseProvider.overrideWithValue(db),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animania',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const MainMenuBar(),
    );
  }
}

class MainMenuBar extends ConsumerStatefulWidget {
  const MainMenuBar({super.key});

  @override
  ConsumerState<MainMenuBar> createState() => _MainMenuBarState();
}

class _MainMenuBarState extends ConsumerState<MainMenuBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AnimeListScreen(),
    const MangaListScreen(),
    const AboutMeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isAdminLoggedIn = ref.watch(loggedInProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Animania"),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Show the account bottom sheet
              showAccountBottomSheet(context, ref);
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Anime'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Manga'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'About Me'),
        ],
      ),
      floatingActionButton: isAdminLoggedIn
          ? FloatingActionButton(
              onPressed: () {
                if (_selectedIndex == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddAnimeScreen()),
                  );
                } else if (_selectedIndex == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddMangaScreen()),
                  );
                }
              },
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}