import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'music_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE songs(
        id INTEGER PRIMARY KEY,
        title TEXT,
        artist TEXT,
        duration INTEGER,
        filePath TEXT
      )
    ''');
  }

  Future<int> insertSong(Map<String, dynamic> song) async {
    Database db = await instance.database;
    return await db.insert('songs', song);
  }

  Future<List<Map<String, dynamic>>> getSongs() async {
    Database db = await instance.database;
    return await db.query('songs');
  }
}

class InsertData {
  Future<List<Map<String, dynamic>>> getLocalSongs() async {
    List<Map<String, dynamic>> songs = [];
    Directory? directory;

    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    }

    if (directory != null) {
      List<FileSystemEntity> files = directory.listSync(recursive: true);
      for (FileSystemEntity file in files) {
        if (file is File && file.path.endsWith('.mp3')) {
          // Extract metadata and other information about the song
          Map<String, dynamic> songInfo = {
            'title': 'Song Title',
            'artist': 'Artist Name',
            'duration': 180, // duration in seconds
            'filePath': file.path,
          };
          songs.add(songInfo);
        }
      }
    }
    print(songs);
    return songs;
  }

  Future<void> insertLocalSongs() async {
    List<Map<String, dynamic>> localSongs = await getLocalSongs();
    for (Map<String, dynamic> song in localSongs) {
      await DatabaseHelper.instance.insertSong(song);
    }
  }
}
