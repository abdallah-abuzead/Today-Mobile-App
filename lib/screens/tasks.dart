import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_treeview/flutter_treeview.dart';
import 'package:today/app_data.dart';
import 'package:today/components/custom_widgets.dart';
import 'package:today/components/rounded_button.dart';
import 'package:today/models/task.dart';
import '../constants.dart';
import 'package:get/get.dart' as Get;
import 'package:expand_widget/expand_widget.dart';

class Tasks extends StatefulWidget {
  static const String id = '/tasks';
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  String? _selectedNode;
  late List<Node> _tasksNodes;
  late TreeViewController _treeViewController;

  List<Node> mapTasksToNodes(List<Task>? tasks) {
    return tasks!.map((task) {
      IconData taskIcon = task.type == 'task' ? Icons.task_outlined : Icons.article_outlined;
      return Node(
          key: task.id.toString(),
          label: task.name.toString(),
          icon: taskIcon,
          data: task,
          children: task.children == null ? [] : mapTasksToNodes(task.children));
    }).toList();
  }

  @override
  void initState() {
    AppData.setTasks();
    _tasksNodes = mapTasksToNodes(AppData.nestedTasks);

    _treeViewController = TreeViewController(
      children: _tasksNodes,
      selectedKey: _selectedNode,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Monkey Tasks', style: TextStyle(fontSize: 17)),
        actions: [
          IconButton(
            icon: Icon(Icons.add, size: 30),
            onPressed: () {
              Get.Get.bottomSheet(
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: ListView(
                    children: [
                      titleText('Add Task', fontSize: 22),
                      SizedBox(height: 25),
                      TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Task Name')),
                      SizedBox(height: 15),
                      TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Start Date')),
                      SizedBox(height: 15),
                      TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'End Date')),
                      SizedBox(height: 15),
                      TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Description')),
                      SizedBox(height: 15),
                      TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Assigned To')),
                      SizedBox(height: 15),
                      RoundedButton(
                        color: AppData.mainColor,
                        child: Text('Add', style: TextStyle(color: Colors.white, fontSize: 16)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.white,
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 5),
          Expanded(
            child: TreeView(
              controller: _treeViewController,
              onExpansionChanged: (key, expanded) => _expandNode(key, expanded),
              // onNodeTap: (key) {
              //   setState(() {
              //     _selectedNode = key;
              //     _treeViewController = _treeViewController.copyWith(selectedKey: key);
              //   });
              // },
              theme: TreeViewTheme(
                expanderTheme: ExpanderThemeData(
                  type: ExpanderType.chevron,
                  color: Colors.grey.shade800,
                  size: 25,
                ),
              ),
              nodeBuilder: (context, node) {
                return Slidable(
                  key: ValueKey(node.key),
                  startActionPane: ActionPane(
                    motion: StretchMotion(),
                    extentRatio: 0.25,
                    dismissible: DismissiblePane(
                      onDismissed: () {
                        setState(() {
                          AppData.allTasks.remove(node.data);
                        });
                      },
                      confirmDismiss: () async {
                        if (node.isParent) {
                          Get.Get.defaultDialog(
                            title: '🚫',
                            titleStyle: TextStyle(
                              color: Colors.red,
                              fontSize: 30,
                            ),
                            content: Text('You can\'t delete a parent task.'),
                            confirm: TextButton(
                              onPressed: () {
                                Get.Get.back();
                              },
                              child: Text('Ok'),
                            ),
                          );
                          return false;
                        }
                        return true;
                      },
                    ),
                    children: [
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: StretchMotion(),
                    extentRatio: 0.25,
                    children: [
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                    ],
                  ),
                  child: Card(
                    color: Colors.grey.shade200,
                    child: ListTile(
                      contentPadding: EdgeInsets.only(left: 5),
                      horizontalTitleGap: 0,
                      leading: Icon(node.icon),
                      title: Text(node.label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                      trailing: IconButton(
                        icon: Icon(Icons.add, size: 28, color: AppData.primaryFontColor),
                        onPressed: () {
                          Get.Get.bottomSheet(
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                              child: ListView(
                                children: [
                                  titleText('Add Task', fontSize: 22),
                                  SizedBox(height: 25),
                                  TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Task Name')),
                                  SizedBox(height: 15),
                                  TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Start Date')),
                                  SizedBox(height: 15),
                                  TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'End Date')),
                                  SizedBox(height: 15),
                                  TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Description')),
                                  SizedBox(height: 15),
                                  TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Assigned To')),
                                  SizedBox(height: 15),
                                  RoundedButton(
                                    color: AppData.mainColor,
                                    child: Text('Add', style: TextStyle(color: Colors.white, fontSize: 16)),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                            backgroundColor: Colors.white,
                          );
                        },
                      ),
                      subtitle: Column(
                        children: [
                          SizedBox(height: 5),
                          ExpandText(
                            node.data.description,
                            expandedHint: 'Details',
                            maxLines: 1,
                            arrowPadding: EdgeInsets.zero,
                          ),
                          SizedBox(height: 5),
                          // Row(
                          //   children: [
                          //     InkWell(
                          //       child: Icon(Icons.edit, color: Colors.blue, size: 18),
                          //       onTap: () {},
                          //     ),
                          //     SizedBox(width: 20),
                          //     InkWell(
                          //       child: Icon(Icons.delete, color: Colors.teal, size: 18),
                          //       onTap: () {},
                          //     ),
                          //     SizedBox(width: 10),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }

  _expandNode(String key, bool expanded) {
    Node? node = _treeViewController.getNode(key);
    if (node != null) {
      List<Node> updated = _treeViewController.updateNode(key, node.copyWith(expanded: expanded));
      setState(() {
        _treeViewController = _treeViewController.copyWith(children: updated);
      });
    }
  }
}
