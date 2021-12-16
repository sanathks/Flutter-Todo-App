import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/const/colors.dart';
import 'package:todo/const/style.dart';
import 'package:todo/data/mockdata.dart';

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
            Container(
                margin: const EdgeInsets.only(top: 40, left: 10, right: 10),
                height: MediaQuery.of(context).size.height,
                child: ListView.separated(
                  itemCount: todo.length,
                  separatorBuilder: (_, __) => const Divider(height: 0.5),
                  itemBuilder: todoItemBuilder,
                ))
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
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[],
        ),
        color: Colors.blueGrey,
      ),
    );
  }

  // Todo item builder
  Container todoItemBuilder(BuildContext context, int index) {
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
                    side: BorderSide(color: Colors.black26),
                    activeColor: blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    value: false,
                    onChanged: (bool? val) {},
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          todo[index].title,
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
  }

  FractionallySizedBox bottomSheetBuilder (BuildContext context) {
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
              onPressed: () => Navigator.pop(context),
            ),
          )

        ],
      ),
      // child: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     mainAxisSize: MainAxisSize.min,
      //     children: <Widget>[
      //       const Text('Modal BottomSheet'),
      //       ElevatedButton(
      //         child: const Text('Close BottomSheet'),
      //         onPressed: () => Navigator.pop(context),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
