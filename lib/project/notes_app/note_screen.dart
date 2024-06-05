
import 'package:flutter/material.dart';
import 'package:flutter_basics/project/notes_app/database_initialization.dart';
import 'package:flutter_basics/project/notes_app/note_count.dart';
import 'package:flutter_basics/project/notes_app/note_model_class.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatefulWidget {
  final Note? note;

  const NoteScreen({this.note,super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {


  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  // void initState() {
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    // TextEditingController titleController = TextEditingController();
    // TextEditingController descriptionController = TextEditingController();

    if (widget.note != null) {
      titleController.text = widget.note!.title;
      descriptionController.text = widget.note!.description;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? "Add a note" : "Edit note"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Center(
                child: Text(
                  "Add your thoughts",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: TextFormField(
                controller: titleController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: "Title",
                    labelText: 'Note title',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.75),
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            TextFormField(
              controller: descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Type the notes here",
                labelText: 'Note description',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.75),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              keyboardType: TextInputType.multiline,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20,top: 30),
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () async {
                      final title = titleController.text;
                      final description = descriptionController.text;
                      if (title.isEmpty) {
                        return;
                      }
                      final Note modelNote=Note(id:widget.note?.id, title: title, description: description);
                      if(widget.note==null){
                        DatabaseInitialization.addNote(modelNote);
                        Provider.of<NoteCounter>(context,listen: false).increment();
                      }
                      else{
                        DatabaseInitialization.updateNote(modelNote);
                      }

                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white, width: 0.75),
                            borderRadius: BorderRadius.all(Radius.circular(10)))),
                    child:  Text(widget.note==null?
                      "Save":"Edit",
                      style:const TextStyle(fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }


}
