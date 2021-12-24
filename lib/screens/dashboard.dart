import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/models/note.dart';
import 'package:todo/screens/manage_note.dart';
import 'package:todo/widgets/notes.dart';
import 'package:todo/const/colors.dart';
import 'package:todo/const/style.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late bool showSearch = false;
  late String query;

  @override
  void initState() {
    showSearch = false;
    query = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Todo",
                        style: GoogleFonts.inter(
                          fontSize: textSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Text("list")
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    color: Colors.black,
                    tooltip:
                        MaterialLocalizations.of(context).closeButtonTooltip,
                    onPressed: () {
                      setState(() {
                        showSearch = true;
                      });
                    },
                  )
                ],
              ),
            ),
            // Search
            if (showSearch)
              Container(
                height: 60,
                color: grey,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              query = value;
                            });
                          },
                          decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.0),
                          ),
                          hintText: "Search notes...",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.0),
                          ),
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              showSearch = false;
                              query = "";
                            });
                          },
                          child: const Text("Cancel")),
                    )
                  ],
                ),
              ),
            Notes(query: query, onClick: (value) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                builder: (BuildContext context) {
                  return ManageNote(note: value,);
                },
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              builder: (BuildContext context) {
                return ManageNote();
              },
            );
          },
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            color: blue,
          )),
    );
  }

}
