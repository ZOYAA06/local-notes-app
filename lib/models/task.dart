import 'package:hive/hive.dart';

class Task {
  String title;
  bool isCompleted;

  Task({
    required this.title,
    this.isCompleted = false,
  });
}

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    return Task(
      title: reader.readString(),
      isCompleted: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer.writeString(obj.title);
    writer.writeBool(obj.isCompleted);
  }
}