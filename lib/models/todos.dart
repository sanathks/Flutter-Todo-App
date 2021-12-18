import 'package:flutter/foundation.dart';
import 'package:todo/const/colors.dart';
import 'package:todo/models/todo.dart';

class Todos extends ChangeNotifier {
   final List<Todo> _items = [
     // Todo("1", "title1", false, null),
     // Todo("2", "title2", false, red),
     // Todo("3", "title3", false, null),
     // Todo("4", "title4", false, null),
   ];

   final List<Todo> _completedItems = [];

  int get todoCount => _items.where((item) => !item.isDone).length;

   void add(Todo todo) {
     _items.add(todo);
     notifyListeners();
   }

   void markAsDone(String id) {
      Todo item = _items.where((element) => element.id == id).first;
      int index = _items.indexOf(item);
     _items[index].isDone = true;
      _items.removeAt(index);
     notifyListeners();
   }

   void remove(String id) {
     Todo item = _items.where((element) => element.id == id).first;
     int index = _items.indexOf(item);
     _items.removeAt(index);
     if (todoCount == 0) {
       notifyListeners();
     }
   }

   Todo get(int index) {
     return _items[index];
   }

   List<Todo> getAll() {
     return  _items.where((item) => !item.isDone).toList();
   }
}