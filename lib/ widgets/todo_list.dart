import 'package:automatic_animated_list/automatic_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/const/colors.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/models/todos.dart';

import 'list_item.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todo = [];

  TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (Provider.of<Todos>(context).todoCount == 0) {
      return Text("dddd");
    }

    return Consumer<Todos>(
        builder: (context, todo, child) => Container(
              margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
              height: MediaQuery.of(context).size.height,
              child: Expanded(
                child: AutomaticAnimatedList<Todo>(
                    items: todo.getAll(),
                    insertDuration: const Duration(milliseconds: 200),
                    removeDuration: const Duration(milliseconds: 200),
                    keyingFunction: (Todo item) => Key(item.id),
                    itemBuilder: (BuildContext context, Todo item,
                        Animation<double> animation) {
                      return Dismissible(
                        direction: DismissDirection.endToStart,
                        key: Key(item.id),
                        background: Container(
                          alignment: AlignmentDirectional.centerEnd,
                          color: red,
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onDismissed: (direction) {
                          todo.remove(item.id);
                        },
                        child: FadeTransition(
                          key: Key(item.id),
                          opacity: animation,
                          child: SizeTransition(
                            sizeFactor: CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeOut,
                              reverseCurve: Curves.easeIn,
                            ),
                            child: ListItem(
                              item: item,
                              onChanged: (bool? value) {
                                todo.markAsDone(item.id);
                              },
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ));
  }
}
