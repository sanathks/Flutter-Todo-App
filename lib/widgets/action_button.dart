import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  final VoidCallback onClick;
  final bool showEdit;
  final bool disabled;

  ActionButton( {required this.onClick, required this.showEdit, required this.disabled });

  @override
  _ActionButtonState createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: widget.disabled ? null : widget.onClick, child: Text( widget.showEdit ? "Edit" : "Save" ));
  }
}