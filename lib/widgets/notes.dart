import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/const/colors.dart';
import 'package:todo/models/note.dart';
import 'package:todo/models/note_repository.dart';
import 'dart:developer';

import 'list_item.dart';

class Notes extends StatelessWidget {
  final String query;
  final ValueChanged<Note> onClick;

  Notes({Key? key, required this.query, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteRepository>(
        builder: (context, note, child) {
          return FutureBuilder<List<Note>>(
              future: note.getAll(query),
              builder:  (BuildContext context, AsyncSnapshot<List<Note>> notes) {

                if (notes.hasData && notes.data!.isEmpty) {
                  return SizedBox(
                    height:  MediaQuery.of(context).size.height * .8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: SvgPicture.asset("assets/empty.svg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("It's Empty", style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),),
                        ),
                        const SizedBox(
                          width: 200,
                          child: Text("Hmm.. looks like you don't have any todos", textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  );
                }
                return Container(
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  height: MediaQuery.of(context).size.height,
                  child: Expanded(
                    child: ListView.builder(
                        itemCount: notes.hasData ? notes.data!.length : 0 ,
                        itemBuilder: (BuildContext context, int index) {
                          return Dismissible(
                            direction: DismissDirection.endToStart,
                            key: Key(note.get(index).id),
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
                              note.delete(note.get(index).id);
                            },
                            child: ListItem(
                              onClick: onClick,
                              item: note.get(index),
                            ),
                          );
                        }),
                  ),
                );
              }
          );
        });
  }
}
