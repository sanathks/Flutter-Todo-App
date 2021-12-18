import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';
import 'package:provider/provider.dart';
import 'package:todo/%20widgets/label_picker.dart';
import 'package:todo/const/colors.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/models/todos.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({Key? key}) : super(key: key);

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  late Color? _label;
  final textController = TextEditingController();


  @override
  void initState() {
    _label = Colors.white;
    super.initState();
  }

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
                child: TextField(
                  controller: textController,
                  decoration: const InputDecoration(
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
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 50),
            child: Text("Label"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: LabelPicker(
                onSelectColor: (value) {
                    setState(() {
                      _label = value;
                    });
                },
                availableColors: const [
                  blue,
                  green,
                  red,
                  yellow,
                  purple,
                  black,
                  grey,
                ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50),
            child: ElevatedButton(
              child: const Text('Add todo'),
              onPressed: () {
                Provider.of<Todos>(context, listen: false).add(
                    Todo(nanoid(10), textController.text, false, _label)
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