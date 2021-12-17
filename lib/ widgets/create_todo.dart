import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/models/todos.dart';

class CreateTodo extends StatelessWidget {
  const CreateTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(Icons.close),
              color: Colors.black,
              tooltip: MaterialLocalizations.of(context)
                  .closeButtonTooltip,
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
          ),
          Row(
            children: [
              Transform.scale(
                scale: 1.4,
                child: Checkbox(
                  side: BorderSide(color: Colors.black54),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  value: false,
                  onChanged: (bool? val) {},
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                child: const TextField(
                  decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                      ),
                      border: InputBorder.none,
                      hintText: 'What do you want todo?'
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: ElevatedButton(
              child: const Text('Add todo'),
              onPressed: () {
                Provider.of<Todos>(context, listen: false).add(
                    Todo("id", "dsfsdsd", false)
                );
                return Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }

}