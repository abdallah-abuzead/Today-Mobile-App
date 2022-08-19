import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:image_picker/image_picker.dart';
import 'package:today/enums.dart';
import 'package:today/models/task.dart';

class AppData {
  static String appName = 'Today';

  // App Colors
  static Color mainColor = Colors.blue;
  static Color primaryFontColor = Color(0XFF4A4B4D);
  static Color secondaryFontColor = Color(0XFF7C7D7E);
  static Color placeholderColor = Color(0XFFB6B7B7);
  static Color facebookColor = Color(0XFF367FC0);
  static Color googleColor = Color(0XFFDD4B39);

  static List<Task> allTasks = [
    Task(
      id: '1',
      name: 'Task 1',
      description: lorem(),
      type: 'userStory',
      assigned_to: 'Ahmed Emad',
      status: 'New',
    ),
    Task(id: '11', name: 'Task 11', description: lorem(), type: 'task', assigned_to: 'Mohamed Emara', status: 'New'),
    Task(
      id: '12',
      name: 'Task 12',
      description: lorem(),
      type: 'userStory',
      assigned_to: 'Ehab Gamal',
      status: 'Pending',
    ),
    Task(id: '121', name: 'Task 121', description: lorem(), type: 'task', assigned_to: 'Mohamed Emara', status: 'New'),
    Task(
      id: '122',
      name: 'Task 122',
      description: lorem(),
      type: 'userStory',
      assigned_to: 'Mohamed Emara',
      status: 'Finished',
    ),
    Task(id: '1221', name: 'Task 1221', description: lorem(), type: 'task', assigned_to: 'Mohamed E', status: 'New'),
    Task(id: '1222', name: 'Task 1222', description: lorem(), type: 'task', assigned_to: 'Mohamed E', status: 'New'),
    Task(id: '2', name: 'Task 2', description: lorem(), type: 'task', assigned_to: 'Mohamed Emara', status: 'Finished'),
    Task(id: '3', name: 'Task 3', description: lorem(), type: 'task', assigned_to: 'Mohamed Emara', status: 'Finished'),
    Task(
      id: '4',
      name: 'Task 4',
      description: lorem(),
      type: 'userStory',
      assigned_to: 'Mohamed Emara',
      status: 'New',
    ),
    Task(id: '41', name: 'Task 41', description: lorem(), type: 'task', assigned_to: 'Mohamed Emara', status: 'New'),
    Task(id: '42', name: 'Task 42', description: lorem(), type: 'task', assigned_to: 'Mohamed Emara', status: 'New'),
  ];

  static setTasks() {
    allTasks[allTasks.indexWhere((task) => task.id == '1')].children = [
      allTasks[allTasks.indexWhere((task) => task.id == '11')],
      allTasks[allTasks.indexWhere((task) => task.id == '12')],
    ];

    allTasks[allTasks.indexWhere((task) => task.id == '12')].children = [
      allTasks[allTasks.indexWhere((task) => task.id == '121')],
      allTasks[allTasks.indexWhere((task) => task.id == '122')],
    ];

    allTasks[allTasks.indexWhere((task) => task.id == '122')].children = [
      allTasks[allTasks.indexWhere((task) => task.id == '1221')],
      allTasks[allTasks.indexWhere((task) => task.id == '1222')],
    ];

    allTasks[allTasks.indexWhere((task) => task.id == '4')].children = [
      allTasks[allTasks.indexWhere((task) => task.id == '41')],
      allTasks[allTasks.indexWhere((task) => task.id == '42')],
    ];
  }

  static List<Task> nestedTasks = [
    allTasks[allTasks.indexWhere((task) => task.id == '1')],
    allTasks[allTasks.indexWhere((task) => task.id == '2')],
    allTasks[allTasks.indexWhere((task) => task.id == '3')],
    allTasks[allTasks.indexWhere((task) => task.id == '4')],
  ];

  static List<Map> tasks = [
    {
      'id': '1',
      'name': 'Task 1',
      'description': lorem(),
      'assigned_to': 'Ahmed Emad',
      'status': 'New',
      'type': 'userStory',
      'children': [
        {
          'id': '11',
          'name': 'Task 11',
          'description': lorem(),
          'assigned_to': 'Mohamed Emara',
          'status': 'Finished',
          'type': 'task',
          'children': null,
        },
        {
          'id': '12',
          'name': 'Task 12',
          'description': lorem(),
          'assigned_to': 'Ehab Gamal',
          'status': 'Pending',
          'type': 'userStory',
          'children': [
            {
              'id': '121',
              'name': 'Task 121',
              'description': lorem(),
              'assigned_to': 'Mohamed Emara',
              'status': 'Finished',
              'type': 'task',
              'children': null,
            },
            {
              'id': '122',
              'name': 'Task 122',
              'description': lorem(),
              'assigned_to': 'Mohamed Emara',
              'status': 'Finished',
              'type': 'task',
              'children': [
                {
                  'id': '1221',
                  'name': 'Task 1211',
                  'description': lorem(),
                  'assigned_to': 'Mohamed Emara',
                  'status': 'Finished',
                  'type': 'task',
                  'children': null,
                },
                {
                  'id': '1222',
                  'name': 'Task 1222',
                  'description': lorem(),
                  'assigned_to': 'Mohamed Emara',
                  'status': 'Finished',
                  'type': 'task',
                  'children': null,
                },
              ],
            },
          ],
        },
      ],
    },
    {
      'id': '2',
      'name': 'Task 2',
      'description': lorem(),
      'assigned_to': 'Mohamed Emara',
      'status': 'Finished',
      'type': 'task',
      'children': null,
    },
    {
      'id': '3',
      'name': 'Task 3',
      'description': lorem(),
      'assigned_to': 'Mohamed Emara',
      'status': 'Finished',
      'type': 'task',
      'children': null,
    },
    {
      'id': '4',
      'name': 'Task 4',
      'description': lorem(),
      'assigned_to': 'Mohamed Emara',
      'status': 'Finished',
      'type': 'task',
      'children': [
        {
          'id': '41',
          'name': 'Task 41',
          'description': lorem(),
          'assigned_to': 'Mohamed Emara',
          'status': 'Finished',
          'type': 'task',
          'children': null,
        },
        {
          'id': '42',
          'name': 'Task 42',
          'description': lorem(),
          'assigned_to': 'Mohamed Emara',
          'status': 'Finished',
          'type': 'task',
          'children': null,
        },
      ],
    },
  ];

  static List<Map> projects = [
    {
      'name': 'Meal Monkey',
      'start_date': '1/1/2022',
      'end_date': '28/2/2022',
      'created_by': 'Ahmed Reda',
      'status': ProjectStatus.New.name,
      'image': 'images/project1.jpg',
    },
    {
      'name': 'Kayan HR',
      'start_date': '1/7/2021',
      'end_date': '30/9/2021',
      'created_by': 'Abdallah Abuzead',
      'status': ProjectStatus.Finished.name,
      'image': 'images/project2.jpg',
    },
    {
      'name': 'Flash Chat',
      'start_date': '1/12/2020',
      'end_date': '30/1/2021',
      'created_by': 'Mostafa Senosy',
      'status': ProjectStatus.Pending.name,
      'image': 'images/project2.jpg',
    },
    {
      'name': 'Weather',
      'start_date': '1/10/2020',
      'end_date': '25/12/2020',
      'created_by': 'Angla',
      'status': ProjectStatus.Cancelled.name,
      'image': 'images/project1.jpg',
    },
  ];

  static Color getStatusColor(String status) {
    if (status == ProjectStatus.New.name)
      return Colors.blue;
    else if (status == ProjectStatus.Pending.name)
      return Colors.yellow;
    else if (status == ProjectStatus.Finished.name)
      return Colors.green;
    else
      return Colors.red;
  }
}
