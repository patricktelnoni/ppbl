import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'mahasiswa.dart';


Future<Database> openMyDatabase() async {
   final databaseName = "myDatabase.db";
   final databaseVersion = 1;

   final table      = 'mahasiswa';

   final columnId   = '_id';
   final columnName = 'name';
   final columnAge  = 'age';

   final tableDosen = 'dosen';

   final dosenId   = '_id';
   final dosenName = 'name';
   final dosenNim  = 'nim';

  final dbPath    = await getDatabasesPath();
  final path      = join(dbPath, databaseName);
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

class DatabaseHandler{
  Future<Database> initializeDB() async {
    return openMyDatabase();
  }

  Future<List<Mahasiswa>> fetchMahasiswa() async{
    List<Mahasiswa> daftarMahasiswa = [];
    final db = await openMyDatabase();

    daftarMahasiswa = await db.query('mahasiswa').then((maps) {
      return List.generate(maps.length, (i) {
        return Mahasiswa(
          id: maps[i]['_id'] as int,
          name: maps[i]['name'] as String,
          age: maps[i]['age'] as int,
        );
      });
    });

    return daftarMahasiswa;
  }

  Future<void> insertMahasiswa(String name) async{
    final db = await openMyDatabase();
    await db.insert(
      'mahasiswa',
      {
        'name': name,
        'age': 25,
      },
    );
  }

  Future<void> hapusMahasiswa(int id) async{
    final db = await openMyDatabase();
    await db.delete('mahasiswa', where: '_id = ?', whereArgs: [id]);

  }
}