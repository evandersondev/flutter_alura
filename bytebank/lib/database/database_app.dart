import 'package:bytebank/database/contact_database.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final dbPath = await getDatabasesPath();
  final fileDbPath = join(dbPath, 'bytebank.db');

  return openDatabase(
    fileDbPath,
    onCreate: (db, version) {
      db.execute(ContactDatabase.table);
    },
    version: 1,
  );
}
