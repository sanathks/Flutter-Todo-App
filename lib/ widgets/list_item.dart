import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/const/colors.dart';
import 'package:todo/models/todo.dart';

class ListItem extends StatelessWidget {

  final Todo item;
  final ValueChanged<bool?>? onChanged;

  const ListItem({Key? key, required this.item, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    value: item.isDone,
                    onChanged: onChanged,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          item.title,
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

}