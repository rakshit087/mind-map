import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

const dbName = "notes.db";
const notesTable = "notes";
const usersTable = "users";
const idColumn = "id";
const emailColumn = "email";
const userIdColumn = "user_id";
const textColumn = "text";
const isSyncedColumn = "is_synced";
const createUserTableQuery = '''
  CREATE TABLE IF NOT EXISTS "users" (
    "id" INTEGER NOT NULL, 
    "email" TEXT NOT NULL UNIQUE,
    PRIMARY KEY("id" AUTO INCREMENT)
  );
''';
const createNotesTableQuery = '''
  CREATE TABLE IF NOT EXISTS "notes" (
    "id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "text" TEXT,
    "is_synced" INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY("id", AUTOINCREMENT)
    FOREIGN KEY("user_id") REFERENCES "user"("id")
  );
''';

@immutable
class DatabaseUser {
  final int id;
  final String email;

  const DatabaseUser({
    required this.id,
    required this.email,
  });

  DatabaseUser.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        email = map[emailColumn] as String;

  @override
  bool operator ==(covariant DatabaseUser other) {
    return id == other.id;
  }

  @override
  int get hashCode => id;
}

class DatabaseNote {
  final int id;
  final int userId;
  final String text;
  final bool isSynced;

  DatabaseNote({
    required this.id,
    required this.userId,
    required this.text,
    required this.isSynced,
  });

  DatabaseNote.fromRow(Map<String, Object?> map)
      : id = map[idColumn] as int,
        userId = map[userIdColumn] as int,
        text = map[textColumn] as String,
        isSynced = map[isSyncedColumn] as int == 0 ? false : true;

  @override
  bool operator ==(covariant DatabaseNote other) {
    return id == other.id;
  }

  @override
  int get hashCode => id;
}

class NotesService {
  Database? _db;

  Future<void> open() async {
    if (_db != null) {
      throw DatabaseAlreadyOpenedException();
    }
    try {
      final docsPath = await getApplicationDocumentsDirectory();
      final dbPath = join(docsPath.path, dbName);
      final db = await openDatabase(dbPath);
      _db = db;
      await db.execute(createUserTableQuery);
      await db.execute(createNotesTableQuery);
    } on MissingPlatformDirectoryException {
      throw UnableToGetDocumentsDirectory();
    }
  }
}

class UnableToGetDocumentsDirectory implements Exception {}

class DatabaseAlreadyOpenedException implements Exception {}
