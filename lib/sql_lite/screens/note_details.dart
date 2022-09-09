import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  const NoteDetails({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  static final _prioritets = ['Hight', 'Low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
        child: ListView(
          children: [
            ListTile(
              title: DropdownButton(
                items: _prioritets.map((String dropStringItems) {
                  return DropdownMenuItem(
                    child: Text(dropStringItems),
                    value: dropStringItems,
                  );
                }).toList(),
                value: 'Low',
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: TextField(
                controller: titleController,
                onChanged: (value) {},
                decoration: InputDecoration(
                    label: Text('Title', style: textStyle),
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: TextField(
                controller: titleController,
                onChanged: (value) {},
                decoration: InputDecoration(
                    label: Text('Description', style: textStyle),
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Save'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('delete'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
