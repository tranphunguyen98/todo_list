import 'package:flutter/material.dart';
import 'package:todo_list/data/model/task.dart';
import 'package:todo_list/data/task_repository.dart';
import 'package:todo_list/presentation/core_widget/widget_circle_inkwell.dart';
import 'package:todo_list/presentation/core_widget/widget_icon_outline_button.dart';
import 'package:todo_list/presentation/core_widget/widget_text_field_non_border.dart';
import 'package:todo_list/util/DateHelper.dart';

class BottomSheetAddTask extends StatefulWidget {
  const BottomSheetAddTask();

  @override
  _BottomSheetAddTaskState createState() => _BottomSheetAddTaskState();
}

class _BottomSheetAddTaskState extends State<BottomSheetAddTask> {
  final TextEditingController _textNameTaskController = TextEditingController();
  final TaskRepository taskRepository = TaskRepository();

  bool visible = true;
  String? dueDate;

  final kColorGray1 = Colors.grey;

  double get kMenuScreenPadding => 8.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextNameTask(),
            buildRowDateAndProject(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textNameTaskController.dispose();
    super.dispose();
  }

  TextFieldNonBorder _buildTextNameTask() {
    return TextFieldNonBorder(
      hint: 'Ví dụ: Đọc sách',
      controller: _textNameTaskController,
      onChanged: (value) {
        setState(() {});
      },
    );
  }

  Row buildRowDateAndProject() {
    final isEnableButton = _textNameTaskController.text.isNotEmpty;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconOutlineButton(
          DateHelper.getDisplayTextDateFromDate(dueDate) ?? "No Date",
          Icons.calendar_today,
          colorIcon: kColorGray1,
          colorBorder: kColorGray1,
          onPressed: () async {
            await onPressedPickDate();
          },
        ),
        Spacer(),
        CircleInkWell(
          Icons.send_outlined,
          size: 24.0,
          colorActiveIcon: Colors.red,
          color: isEnableButton ? Colors.red : Colors.grey,
          onPressed: isEnableButton
              ? () {
                  final task = Task(DateTime.now().toString(), dueDate, _textNameTaskController.text);
                  taskRepository.addTask(task);
                }
              : null,
        ),
      ],
    );
  }

  Future onPressedPickDate() async {
    setState(() {
      visible = false;
    });

    final picker = await showDatePicker(
      context: context,
      initialDate: DateTime.parse(DateTime.now().toIso8601String()),
      firstDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
      ),
      lastDate: DateTime(2100),
    );
    setState(() {
      visible = true;
    });
    if (picker != null) {
      setState(() {
        dueDate = picker.toIso8601String();
      });
    }
  }
}
