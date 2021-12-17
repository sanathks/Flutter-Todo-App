import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/const/colors.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/models/todos.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todo = [];
  TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<Todos>(
      builder: (context, todo, child) => Container(
          margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
          height: MediaQuery.of(context).size.height,
          child: ListView.separated(
            itemCount: todo.todoCount,
            separatorBuilder: (_, __) => const Divider(height: 0.5),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 65,
                margin: const EdgeInsets.only(bottom: 0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.4,
                            child: Checkbox(
                              side: const BorderSide(color: Colors.black26),
                              activeColor: blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              value: todo.get(index).isDone,
                              onChanged: (bool? val) {
                                todo.markAsDone(index);
                                Future.delayed(
                                  const Duration(milliseconds: 250),
                                      () => todo.remove(index),
                                );
                              },
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  child: Text(
                                    todo.get(index).title,
                                    style: GoogleFonts.sourceSansPro(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: black
                                    ),
                                    overflow: TextOverflow.clip,
                                  ))
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                            color: green, shape: BoxShape.circle),
                      )
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}