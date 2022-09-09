import 'package:flutter/material.dart';
import 'package:sound/sql_lite/screens/note_details.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => NoteListState();
}

class NoteListState extends State<NoteList> {
  int count = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: getNoteList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToDetails('Add Notes');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void navigateToDetails(String title) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NoteDetails(title: title),
        ));
  }

  ListView getNoteList() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2,
          child: ListTile(
            onTap: () {
              navigateToDetails('Edit Note');
            },
            title: const Text('Meet aaron'),
            subtitle: const Text('Nov'),
            leading: const CircleAvatar(
              child: Icon(Icons.keyboard_arrow_right_outlined),
              backgroundColor: Colors.yellow,
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.grey,
              ),
            ),
          ),
        );
      },
    );
  }
}

class Note extends StatelessWidget {
  const Note({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Note2 extends StatelessWidget {
  const Note2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
