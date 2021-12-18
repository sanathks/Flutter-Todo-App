import 'package:flutter/material.dart';

class LabelPicker extends StatefulWidget {
  final Function onSelectColor;
  final List<Color> availableColors;

  const LabelPicker(
      {required this.onSelectColor,
        required this.availableColors});

  @override
  _LabelPickerState createState() => _LabelPickerState();
}

class _LabelPickerState extends State<LabelPicker> {
  late Color _label;

  @override
  void initState() {
    _label = Colors.white;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 30,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: widget.availableColors.length,
        itemBuilder: (context, index) {
          final itemColor = widget.availableColors[index];
          return InkWell(
            onTap: () {
              widget.onSelectColor(itemColor);
              setState(() {
                _label = itemColor;
              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: itemColor,
                  shape: BoxShape.circle
              ),
              child: itemColor == _label
                  ? const Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              )
                  : Container(),
            ),
          );
        },
      ),
    );
  }
}