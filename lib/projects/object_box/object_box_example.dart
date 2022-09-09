import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:sound/main.dart';
import 'package:sound/projects/object_box/user_model.dart';

class ObjectBoxPage extends StatefulWidget {
  const ObjectBoxPage({Key? key}) : super(key: key);

  @override
  State<ObjectBoxPage> createState() => _ObjectBoxPageState();
}

class _ObjectBoxPageState extends State<ObjectBoxPage> {
  late Stream<List<User>> streamUsers;

  @override
  void initState() {
    super.initState();
    streamUsers = objectBox.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ObjectBox'),
      ),
      body: StreamBuilder<List<User>>(
          stream: streamUsers,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              final users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('${users[index].name}'),
                    subtitle: Text('${users[index].email}'),
                  );
                },
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final user = User(

              name: Faker().person.firstName(),
              email: Faker().internet.email());
          objectBox.insertUser(user);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
