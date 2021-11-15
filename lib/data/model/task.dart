import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String? date;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final bool isDone;

  Task(this.id, this.date, this.content, [this.isDone = false]);
}
