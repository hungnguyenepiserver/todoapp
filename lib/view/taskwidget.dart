import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/model/task.dart';
import 'package:todoapp/provider/tasknotifier.dart';
import 'package:todoapp/model/viewmode.dart';

class TaskWidget extends StatefulWidget {
  late ViewMode type;
  late String title;

  TaskWidget(this.type, this.title, {Key? key}) : super(key: key);

  @override
  State<TaskWidget> createState() => TaskState();
}

class TaskState extends State<TaskWidget> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskNotifier>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),

        body: ListView(
            children: getVisibleItemByType()
        ));
  }

  List<CheckboxListTile> getVisibleItemByType(){

    List<CheckboxListTile> retVal = [];

    for (int i = 0; i< context.watch<TaskNotifier>().taskList.length; i++) {
      Task task = context.watch<TaskNotifier>().getItem(i);
      if ((widget.type == ViewMode.todo && !task.isChecked) || (widget.type == ViewMode.complete && task.isChecked) || widget.type == ViewMode.all){
        retVal.add(CheckboxListTile(
          title: Text(task.title),
          value: task.isChecked,
          onChanged: (newValue) {
            task.isChecked = newValue!;
            context.read<TaskNotifier>().updateItem(i, task);
          },
          controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
        ));
      }
    }
    return retVal;
  }
}