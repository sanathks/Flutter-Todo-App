import 'package:flutter/material.dart';
import 'package:todo/models/note.dart';

class ListItem extends StatelessWidget {

  final Note item;
  final ValueChanged<Note> onClick;

  const ListItem({Key? key, required this.item, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Ink(
        color: Colors.white,
        child: ListTile(
          onTap: () {
            onClick(item);
          },
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 0.5, color: Colors.white),
              borderRadius: BorderRadius.circular(5)),
          title: Text(item.title),
          subtitle: Text(item.summary.replaceAll("\n", ""), overflow: TextOverflow.ellipsis,),
          trailing: Container(
                    height: MediaQuery.of(context).size.height,
                    width: 10,
                    decoration: BoxDecoration(
                        color: item.label,
                    ),
                  ),
          contentPadding: const EdgeInsets.only(right: 0, left: 10),
        ),
      ),
    );
  }

}