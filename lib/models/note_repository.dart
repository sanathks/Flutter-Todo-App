import 'dart:convert';
import 'dart:ui';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/models/note.dart';

class NoteRepository extends ChangeNotifier {
  final tableName = "notes";
   late List<Note> _items = [];

   Future<Database> db() async {
     return openDatabase(
       join(await getDatabasesPath(), 'notes.db'),
       onCreate: (db, version) {
         return db.execute(
           'create table notes ( id  TEXT, title  TEXT, summary  TEXT, note TEXT, createdAt TEXT, label TEXT)',
         );
       }, version : 1 ,
     );
   }

   void save(Note todo) async {
     _items.add(todo);
     Database db = await this.db();
     db.insert(tableName, todo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,).then((value)  {
         notifyListeners();
   });

   }

   void update(String id, String title, String summary, List<dynamic> note, Color label) async {
     Database db = await this.db();
     Note item = _items.where((element) => element.id == id).first;
     int index = _items.indexOf(item);
     _items.removeAt(index);
     Note mNote = Note(id, title, summary, note, DateTime.now(), label);
     await db.update(tableName, mNote.toMap(), where: 'id = ?', whereArgs: [id],);
     _items.add(mNote);
     notifyListeners();
   }


   Future<void> delete(String id) async {
     Database db = await this.db();
     Note item = _items.where((element) => element.id == id).first;
     int index = _items.indexOf(item);
     _items.removeAt(index);
     await db.delete(tableName, where: 'id = ?', whereArgs: [id],);
     if (_items.isEmpty) {
       notifyListeners();
     }
   }

   Note get(int index) {
     return _items[index];
   }

   Future<List<Note>> getAll(String query) async {
     Database db = await this.db();

     if (query.isEmpty) {
       return getAllNotes();
     }

     final maps = await db.query(tableName, where: "title LIKE ?", whereArgs: ['%$query%']);
     _items = maps.map((note) {
       return Note.fromJson(note);
     }).toList();
      return _items;
   }

  Future<List<Note>> getAllNotes() async {
    Database db = await this.db();
    final maps = await db.query(tableName);
    _items = maps.map((note) {
      return Note.fromJson(note);
    }).toList();
    return _items;
  }
}