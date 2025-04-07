import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@Collection()
class Anime {
  Id id = Isar.autoIncrement;
  late String title;
  late String genre;
  late String description;
}

@Collection()
class Manga {
  Id id = Isar.autoIncrement;
  late String title;
  late String genre;
  late String description;
}

@Collection()
class Admin {
  Id id = Isar.autoIncrement;
  late String username;
  late String password;
}

class DatabaseService {
  Isar? isar;

  Future<void> initialize() async {
    if (isar == null) {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open(
        [AnimeSchema, MangaSchema, AdminSchema],
        directory: dir.path,
      );
    }
  }

  Future<void> addAnime(String title, String genre, String description) async {
    if (isar == null) throw Exception("Database not initialized");
    final anime = Anime()
      ..title = title
      ..genre = genre
      ..description = description;
    await isar!.writeTxn(() async {
      await isar!.animes.put(anime);
    });
  }

  Future<void> updateAnime(int id, String title, String genre, String description) async {
    if (isar == null) throw Exception("Database not initialized");
    await isar!.writeTxn(() async {
      final anime = await isar!.animes.get(id);
      if (anime != null) {
        anime.title = title;
        anime.genre = genre;
        anime.description = description;
        await isar!.animes.put(anime);
      } else {
        throw Exception("Anime with ID $id not found");
      }
    });
  }

  Future<void> deleteAnime(int id) async {
    if (isar == null) throw Exception("Database not initialized");
    await isar!.writeTxn(() async {
      await isar!.animes.delete(id);
    });
  }

  Future<List<Anime>> getAllAnime() async {
    if (isar == null) throw Exception("Database not initialized");
    return await isar!.animes.where().findAll();
  }

  Future<void> addManga(String title, String genre, String description) async {
    if (isar == null) throw Exception("Database not initialized");
    final manga = Manga()
      ..title = title
      ..genre = genre
      ..description = description;
    await isar!.writeTxn(() async {
      await isar!.mangas.put(manga);
    });
  }

  Future<void> updateManga(int id, String title, String genre, String description) async {
    if (isar == null) throw Exception("Database not initialized");
    await isar!.writeTxn(() async {
      final manga = await isar!.mangas.get(id);
      if (manga != null) {
        manga.title = title;
        manga.genre = genre;
        manga.description = description;
        await isar!.mangas.put(manga);
      } else {
        throw Exception("Manga with ID $id not found");
      }
    });
  }

  Future<void> deleteManga(int id) async {
    if (isar == null) throw Exception("Database not initialized");
    await isar!.writeTxn(() async {
      await isar!.mangas.delete(id);
    });
  }

  Future<List<Manga>> getAllManga() async {
    if (isar == null) throw Exception("Database not initialized");
    return await isar!.mangas.where().findAll();
  }

    Future<Admin?> getAdmin(String username, String password) async {
    if (isar == null) throw Exception("Database not initialized");

    final adminQuery = isar!.admins.filter()
        .usernameEqualTo(username)
        .passwordEqualTo(password)
        .findFirst();

    return adminQuery;
  }

  Future<void> addAdmin(String username, String password) async {
    if (isar == null) throw Exception("Database not initialized");

    final admin = Admin()
      ..username = username
      ..password = password;

    await isar!.writeTxn(() async {
      await isar!.admins.put(admin);
    });
  }
}