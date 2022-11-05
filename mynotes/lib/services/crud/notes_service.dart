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

  Future<void> close() async {
    final db = _db;
    if (db == null) {
      throw DatabaseNotOpenedException();
    }
    await db.close();
    _db = null;
  }

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

  Database _getDatabaseOrThrow() {
    final db = _db;
    if (db == null) {
      throw DatabaseIsNotOpenException();
    } else {
      return db;
    }
  }

  Future<void> deleteUser({required String email}) async {
    final db = _getDatabaseOrThrow();
    final deletedAccount = await db.delete(
      usersTable,
      where: 'email = ?',
      whereArgs: [email.toLowerCase()],
    );
    if (deletedAccount != 1) {
      throw UnableToDeleteUser();
    }
  }

  Future<DatabaseUser> addUser({required String email}) async {
    final db = _getDatabaseOrThrow();
    final result = await db.query(
      usersTable,
      limit: 1,
      where: "email = ?",
      whereArgs: [email.toLowerCase()],
    );
    if (result.isNotEmpty) {
      throw UserAlreadyExists();
    }
    final userId = await db.insert(usersTable, {
      emailColumn: email.toLowerCase(),
    });
    return DatabaseUser(id: userId, email: email);
  }

  Future<DatabaseUser> getUser({required String email}) async {
    final db = _getDatabaseOrThrow();
    final result = await db.query(
      usersTable,
      limit: 1,
      where: "email = ?",
      whereArgs: [email.toLowerCase()],
    );
    if (result.isEmpty) {
      throw UserNotFoundException();
    }
    return DatabaseUser.fromRow(result.first);
  }

  Future<DatabaseNote> addNote({required DatabaseUser user}) async {
    final db = _getDatabaseOrThrow();
    final dbUser = await getUser(email: user.email);
    if (user != dbUser) {
      throw UserNotFoundException();
    }
    const text = '';
    final noteId = await db.insert(notesTable, {
      userIdColumn: user.id,
      textColumn: text,
      isSyncedColumn: 0,
    });
    final note = DatabaseNote(
      id: noteId,
      userId: user.id,
      text: text,
      isSynced: false,
    );
    return note;
  }

  Future<void> deleteNote({required int id}) async {
    final db = _getDatabaseOrThrow();
    final deletedAccount = await db.delete(
      usersTable,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (deletedAccount != 1) {
      throw UnableToDeleteNote();
    }
  }

  Future<int> deleteAllNotes() async {
    final db = _getDatabaseOrThrow();
    return await db.delete(notesTable);
  }
}

class UnableToDeleteNote implements Exception {}

class UserNotFoundException implements Exception {}

class UserAlreadyExists implements Exception {}

class UnableToDeleteUser implements Exception {}

class DatabaseIsNotOpenException implements Exception {}

class DatabaseNotOpenedException implements Exception {}

class UnableToGetDocumentsDirectory implements Exception {}

class DatabaseAlreadyOpenedException implements Exception {}
