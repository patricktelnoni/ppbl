import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


Future<Database> openMyDatabase() async {
   final _databaseName = "myDatabase.db";
   final _databaseVersion = 1;

   final table      = 'mahasiswa';

   final columnId   = '_id';
   final columnName = 'name';
   final columnAge  = 'age';

   final tableDosen = 'dosen';

   final dosenId   = '_id';
   final dosenName = 'name';
   final dosenNim  = 'nim';

  final dbPath    = await getDatabasesPath();
  final path      = join(dbPath, _databaseName);
  final database  = await openDatabase(
    path,
    version: 2,
    onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < 2) {
        // Perform the migration from version 1 to version 2
        await db.execute('''
          CREATE TABLE $tableDosen (
            $dosenId INTEGER PRIMARY KEY,
            $dosenName TEXT NOT NULL,
            $dosenNim INTEGER NOT NULL
          )
          ''');

      }
    },
    onCreate: (db, version) async {
      // Create tables here
      db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnAge INTEGER NOT NULL
          )
          ''');

    },
  );
  return database;
}