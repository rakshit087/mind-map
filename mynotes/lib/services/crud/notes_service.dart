import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseUser {
  final int id;
  final String email;

  DatabaseUser({
    required this.id,
    required this.email,
  });
}
