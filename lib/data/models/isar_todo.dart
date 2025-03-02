/*
ISAR TODO Model

Converts todo model into isar todo model that we can store in our db.
*/

import 'package:bloc_todo/domain/models/todo.dart';
import 'package:isar/isar.dart';

// To generate isar todo object, run: dart run build_runner build
part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  //Convert Isar object to pure object to use in our app
  Todo toDomain() {
    return Todo(id: id, text: text, isCompleted: isCompleted);
  }

  //Convert pure object to Isr object to store in Isar DB
  TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }
}
