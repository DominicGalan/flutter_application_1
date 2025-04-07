import 'package:flutter_application_1/MIdterm%20Exam/DataBase/database.dart';

void initializeDefaultAdmin(DatabaseService db) async {
  final adminExists = await db.getAdmin("admin", "password123");
  if (adminExists == null) {
    final admin = Admin()
      ..username = "admin"
      ..password = "password123";
    await db.addAdmin(admin.username, admin.password);
  }
}