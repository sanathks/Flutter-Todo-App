import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/%20widgets/create_todo.dart';
import 'package:todo/%20widgets/todo_list.dart';
import 'package:todo/const/colors.dart';
import 'package:todo/const/style.dart';
import 'package:todo/models/todos.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
                left: 50,
              ),
              child: Row(
                children: [
                  Text(
                    "Today",
                    style: GoogleFonts.inter(
                      fontSize: textSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text("mop"),
                ],
              ),
            ),
            TodoList()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              builder: bottomSheetBuilder,
            );
          },
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            color: blue,
          )),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 35,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  icon: const Icon(Icons.list),
                  color: Colors.black,
                  tooltip: MaterialLocalizations.of(context)
                      .closeButtonTooltip,
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  icon: const Icon(Icons.playlist_add_check),
                  color: Colors.black,
                  tooltip: MaterialLocalizations.of(context)
                      .closeButtonTooltip,
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                ),
              ),
            ],
          ),
        ),
        color: gray,
        shape: const CircularNotchedRectangle(),
      ),
    );
  }

  CreateTodo bottomSheetBuilder (BuildContext context) {
    return const CreateTodo();
  }
}
