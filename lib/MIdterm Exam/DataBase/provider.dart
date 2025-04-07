// lib/providers/provider.dart
import 'package:flutter_application_1/MIdterm%20Exam/DataBase/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<DatabaseService>((ref) {
  throw Exception("Database provider was used before initialization");
});

final loggedInProvider = StateProvider<bool>((ref) => false);
final adminProvider = StateProvider<bool>((ref) => false);