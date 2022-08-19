import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:today/app_data.dart';
import 'package:today/screens/tasks.dart';

class ProjectCard extends StatelessWidget {
  ProjectCard({required this.project});
  final Map project;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () => Get.toNamed(Tasks.id),
        child: Container(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppData.placeholderColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(project['image'], fit: BoxFit.cover),
                height: 200,
                width: Get.width,
              ),
              Divider(thickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    project['name'],
                    style: TextStyle(color: AppData.primaryFontColor, fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    project['status'],
                    style: TextStyle(
                      fontSize: 13,
                      color: AppData.getStatusColor(project['status']),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Created By :  ' + project['created_by'],
                style: TextStyle(color: AppData.secondaryFontColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Start Date :  ' + project['start_date'],
                    style: TextStyle(color: AppData.secondaryFontColor, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'End Date :  ' + project['end_date'],
                    style: TextStyle(color: AppData.secondaryFontColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Icon(Icons.edit, color: Colors.blue),
                    onTap: () {},
                  ),
                  SizedBox(width: 20),
                  InkWell(
                    child: Icon(Icons.delete, color: Colors.red),
                    onTap: () {},
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
