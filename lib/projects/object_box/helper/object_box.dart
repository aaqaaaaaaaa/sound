import 'package:sound/projects/object_box/objectbox.g.dart';
import 'package:sound/projects/object_box/user_model.dart';

class ObjectBox {
  late Store store;
  late Box<User> _userBox;

  ObjectBox._init(this.store) {
    _userBox = Box<User>(store);
  }

  static Future<ObjectBox> init() async {
    final store = await openStore();
    return ObjectBox._init(store);
  }

  User? getUser(int id) => _userBox.get(id);

  Stream<List<User>> getUsers() => _userBox
      .query()
      .watch(triggerImmediately: true)
      .map((event) => event.find());

  int insertUser(User user) => _userBox.put(user);

  bool deleteUser(int id) => _userBox.remove(id);
}
