import 'package:flutter/material.dart';
import 'package:flutter_basics/project/notes_app/database_initialization.dart';
import 'package:flutter_basics/project/notes_app/note_count.dart';
import 'package:flutter_basics/project/notes_app/note_screen.dart';
import 'package:flutter_basics/project/notes_app/note_model_class.dart';
import 'package:flutter_basics/project/notes_app/snack_bar.dart';
import 'package:flutter_basics/project/notes_app/styles/text_style.dart';
import 'package:flutter_basics/project/notes_app/styles/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<NoteCounter>.value(
      value: NoteCounter(),
      child: MaterialApp(
        home: const NoteMainScreen(),
        title: "My Notes",
        theme: getThemeData(),
        themeMode: ThemeMode.light,
      )));
}

class NoteMainScreen extends StatefulWidget {
  const NoteMainScreen({super.key});

  @override
  State<NoteMainScreen> createState() => _NoteMainScreenState();
}

class _NoteMainScreenState extends State<NoteMainScreen> {
  late Future<List<Note>?> _notesFuture;

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }


  Future<void> _refreshNotes() async {
    setState(() {
      _notesFuture = DatabaseInitialization.getAllNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: FutureBuilder<List<Note>?>(
          future: _notesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text(
                'Error: ${snapshot.error}',
                style: getTextStyle(FontWeight.w500, 17),
              ));
            } else if (snapshot.hasData) {
              List<Note>? notes = snapshot.data;
              if (notes == null || notes.isEmpty) {
                return Center(
                  child: Text('No notes available', style: getTextStyle(FontWeight.w500, 17)),
                );
              } else {
                return ListView.separated(
                  itemCount: notes.length,
                  separatorBuilder: (context,_){
                    return const Divider(height: 10,indent: 25,endIndent: 25,thickness: 1,);
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        Icons.sticky_note_2_rounded,
                        size: 30,
                        color: Colors.grey[700],
                      ),
                      title: Text(notes[index].title, style: getTextStyle(FontWeight.w500, 20)),
                      subtitle: Text(
                        notes[index].description.length > 20
                            ? '${notes[index].description.substring(0, 30)}...'
                            : notes[index].description,
                        style: getTextStyle(FontWeight.w500, 13),
                      ),
                      trailing: IconButton(
                        style: IconButton.styleFrom(backgroundColor: Colors.red[200]),
                        icon: Icon(
                          Icons.delete,
                          size: 25,
                          color: Colors.grey[700],
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text("Delete file?", style: getTextStyle(FontWeight.w700, 20)),
                                    content: Text(
                                      "Are you sure you want to delete'${notes[index].title}' file?",
                                      style: getTextStyle(FontWeight.w500, 15),
                                    ),
                                    elevation: 50,
                                    contentPadding: const EdgeInsets.all(30),
                                    titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    titlePadding: const EdgeInsets.only(left: 100, top: 10, bottom: 10, right: 20),
                                    actions: [
                                      InkWell(
                                        child: TextButton(
                                            onPressed: () async {
                                              Note deletedNote = notes[index];
                                              await DatabaseInitialization.deleteNote(notes[index].id!).then((value) {
                                                Provider.of<NoteCounter>(context,listen: false).decrement();
                                                Navigator.of(context).pop();
                                                _refreshNotes();
                                                setState(() {});
                                                ScaffoldMessenger.of(context).showSnackBar(getSnackBarNote(
                                                  Text("file '${notes[index].title}' deleted successfully",
                                                      style: getTextStyle(FontWeight.w300, 10)),
                                                  SnackBarAction(
                                                      label: "undo",
                                                      onPressed: () async {
                                                        await DatabaseInitialization.addNote(deletedNote).then(
                                                            (_) => {Provider.of<NoteCounter>(context,listen: false)
                                                                .increment()
                                                            });
                                                        setState(() {});
                                                      }),
                                                ));
                                                _refreshNotes();
                                              });
                                            },
                                            child: Text(
                                              "Yes",
                                              style: getTextStyle(FontWeight.w300, 10),
                                            )),
                                      ),
                                      InkWell(
                                        child: TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("No",
                                                style: getTextStyle(FontWeight.w400, 15).copyWith(color: Colors.red))),
                                      )
                                    ],
                                  ));
                        },
                      ),
                      onTap: () async {
                        await Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) => NoteScreen(note: notes[index])));
                        _refreshNotes();
                      },
                    );
                  },
                );
              }
            } else {
              return const Center(child: Text('No notes available'));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[400],
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const NoteScreen()));
          _refreshNotes();
        },
        elevation: 20,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.black,
        ),
      ),
      persistentFooterButtons: [
        Provider.of<NoteCounter>(context, listen: false).count > 0
            ? TextButton(
                onPressed: () async {
                  await DatabaseInitialization.deleteAllNotes();
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(getSnackBarNote(
                      Text("All files deleted successfully", style: getTextStyle(FontWeight.w300, 10)),
                      null,
                    )
                    );
                    _refreshNotes();
                    Provider.of<NoteCounter>(context,listen: false).count=0;
                  });
                },
                child: const Text(
                  "Delete all",
                ),
              )
            : const SizedBox(),
        TextButton(onPressed: ()async{
          await DatabaseInitialization.deleteTable("notes");
          setState(() {});
        }, child: const Text("Delete table 'notes'")),
        TextButton(onPressed: ()async{
          await DatabaseInitialization.createTable();
          setState(() {});
        }, child: const Text("create table 'notes'"))
      ],
    );
  }
}
