/*
TODO model

Model propeties
id
text
isCompleted

--------------------

Methods
toggle completion on/off
*/

class Todo {
  final int id;
  final String text;
  final bool isCompleted;

  Todo({required this.id, required this.text, this.isCompleted = false});

  Todo toggleCompletion() {
    return Todo(id: id, text: text, isCompleted: !isCompleted);
  }
}
