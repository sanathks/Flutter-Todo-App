class Todo {
  late String id;
  late String title;

  Todo(this.id, this.title);
}

List<Todo> todo = todosData
    .map((item) => Todo(item['id'].toString(), item['title'].toString()))
    .toList();

var todosData = [
  {
    "id": 1,
    "title": "Buy fish from market",
  },
  {
    "id": 2,
    "title": "Send email to sandy",
  },
  {
    "id": 3,
    "title": "Pay utility bills",
  },
  {
    "id": 4,
    "title": "Car wash",
  },
  {
    "id": 5,
    "title": "Insurance renewals",
  },
  {
    "id": 6,
    "title": "Pay rent",
  },
  {
    "id": 7,
    "title": "Pick the Dinuya from school at 10.00 AM, Adding some more text to see the visual effect",
  },
  {
    "id": 8,
    "title": "Check tradelist",
  }
];