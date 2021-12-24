import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:nanoid/nanoid.dart';
import 'package:provider/provider.dart';
import 'package:todo/const/colors.dart';
import 'package:todo/models/note.dart';
import 'package:todo/models/note_repository.dart';
import 'package:todo/widgets/action_button.dart';
import 'package:todo/widgets/label_picker.dart';

class ManageNote extends StatefulWidget {
  final Note? note;
  const ManageNote({Key? key, this.note}) : super(key: key);

  @override
  State<ManageNote> createState() => _ManageNoteState();
}

class _ManageNoteState extends State<ManageNote> {
  late Color _label;
  late final TextEditingController textController;
  late final QuillController _controller = QuillController(
    document: widget.note != null ? Document.fromJson((widget.note!.note)) : Document(),
    selection: const TextSelection.collapsed(offset: 0),
  );

  @override
  void initState() {
    _label = Colors.white;
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textController.text = (widget.note != null ? widget.note?.title : "")!;
    return FractionallySizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 50, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                  tooltip: MaterialLocalizations.of(context)
                      .closeButtonTooltip,
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                ),
                ValueListenableBuilder<TextEditingValue>(
                  valueListenable: textController,
                  builder: (context, value, child) {
                    return ActionButton(onClick: () {
                      if (widget.note != null) {
                        Provider.of<NoteRepository>(context, listen: false).update(
                            widget.note!.id,
                            textController.text,
                            _controller.plainTextEditingValue.text,
                            _controller.document.toDelta().toJson(),
                            _label
                        );
                        Navigator.maybePop(context);
                        return;
                      }
                      Provider.of<NoteRepository>(context, listen: false).save(
                          Note(
                              nanoid(10),
                              textController.text,
                              _controller.plainTextEditingValue.text,
                              _controller.document.toDelta().toJson(),
                              DateTime.now(),
                              _label
                          )
                      );
                      Navigator.maybePop(context);
                    },
                      showEdit: false,
                      disabled: value.text.isEmpty,
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 0, right: 40),
            child: Column(
              children: [
                TextField(
                  autofocus: true,
                  controller: textController,
                  style: const TextStyle(
                      fontSize: 24
                  ),
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        color: Colors.grey
                    ),
                    border: InputBorder.none,
                    hintText: 'Untitled...',
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .65,
                  child: Expanded(
                    child: QuillEditor(
                      controller: _controller,
                      readOnly: false,
                      scrollController: ScrollController(),
                      scrollable: true,
                      focusNode: FocusNode(),
                      autoFocus: false,
                      expands: false,
                      padding: EdgeInsets.zero,
                      placeholder: 'Type here...',
                    ),
                  ),
                ),
                QuillToolbar.basic(
                  controller: _controller,
                  showDividers: false,
                  showSmallButton: false,
                  showInlineCode: false,
                  showColorButton: false,
                  showBackgroundColorButton: false,
                  showClearFormat: false,
                  showHeaderStyle: false,
                  showListNumbers: false,
                  showListCheck: false,
                  showCodeBlock: false,
                  showIndent: false,
                  showLink: false,
                  showHistory: false,
                  showHorizontalRule: false,
                  multiRowsDisplay: false,
                  showImageButton: false,
                  showVideoButton: false,
                  showCameraButton: false,
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
                      dark,
                      grey,
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}