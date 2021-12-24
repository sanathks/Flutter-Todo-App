import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> db() async {
  WidgetsFlutterBinding.ensureInitialized();
    return openDatabase(
    join(await getDatabasesPath(), 'notes.db'),
    onCreate: (db, version) {
          return db.execute(
          'create table notes ( id  varchar(10) constraint notes_pk primary key, title  text, summary  text, note text, createdAt datetime, label  varchar(10))',
          );
    }, version : 1 ,
  );
}