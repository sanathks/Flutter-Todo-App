import 'package:flutter/foundation.dart';
import 'package:todo/models/todo.dart';

class Todos extends ChangeNotifier {
   final List<Todo> _items = [
     Todo("1", "title", false)
   ];

   final List<Todo> _completedItems = [];

   int get todoCount => _items.length;
   // int get todoCount => _items.where((item) => !item.isDone).length;

   void add(Todo todo) {
     _items.add(todo);
     notifyListeners();
   }

   void markAsDone(int index) {
     _items[index].isDone = true;
     notifyListeners();
   }

   void remove(int index) {
     Todo item = _items[index];
     _items.removeAt(index);
     item.isDone = true;
     _completedItems.add(item);
     notifyListeners();
   }

   Todo get(int index) {
     return _items[index];
   }

}

// List<Todo> todo = todosData
//     .map((item) => Todo(item['id'].toString(), item['title'].toString(), true))
//     .toList();
//
// var todosData = [
//   {
//     "id": 1,
//     "title": "Buy fish from market",
//   },
//   {
//     "id": 2,
//     "title": "Send email to sandy",
//   },
//   {
//     "id": 3,
//     "title": "Pay utility bills",
//   },
//   {
//     "id": 4,
//     "title": "Car wash",
//   },
//   {
//     "id": 5,
//     "title": "Insurance renewals",
//   },
//   {
//     "id": 6,
//     "title": "Pay rent",
//   },
//   {
//     "id": 7,
//     "title": "Pick the Dinuya from school at 10.00 AM, Adding some more text to see the visual effect",
//   },
//   {
//     "id": 8,
//     "title": "Check tradelist",
//   }
// ];