import 'dart:convert';
import 'dart:ui';
import 'dart:developer';

import 'package:todo/const/colors.dart';

class Note {
  late String id;
  late String title;
  late String summary;
  late List<dynamic> note;
  late DateTime createdAt;
  late Color label;

  Note(this.id, this.title, this.summary, this.note, this.createdAt, this.label);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'note': jsonEncode(note),
      'label': label.toString().split('(0x')[1].split(')')[0]
    };
  }

  static Note fromJson(Map<String, dynamic> note) {
    int value = int.parse(note['label'], radix: 16);
    return  Note(
      note['id'] as String,
      note['title'] as String,
      note['summary'] as String,
      jsonDecode(note['note'] as String),
      DateTime.now(),
      Color(value),
    );
  }


}
