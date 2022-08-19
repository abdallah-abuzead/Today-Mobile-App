import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:today/app_data.dart';
import 'package:today/components/custom_widgets.dart';
import 'package:today/components/project_card.dart';
import 'package:today/components/rounded_button.dart';
import 'package:today/components/side_drawer.dart';
import 'package:today/constants.dart';
import 'package:today/screens/ocr/scanned_images.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const String id = '/home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Projects', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
              icon: Icon(Icons.add, size: 30),
              onPressed: () {
                Get.bottomSheet(
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        titleText('Create Project', fontSize: 22),
                        SizedBox(height: 25),
                        TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Project Name')),
                        SizedBox(height: 15),
                        TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'Start Date')),
                        SizedBox(height: 15),
                        TextField(decoration: kTextFieldDecoration.copyWith(hintText: 'End Date')),
                        SizedBox(height: 15),
                        RoundedButton(
                          color: AppData.mainColor,
                          child: Text('Create', style: TextStyle(color: Colors.white, fontSize: 16)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  backgroundColor: Colors.white,
                );
              },
            ),
            IconButton(
              onPressed: () => Get.toNamed(ScannedImages.id),
              icon: Icon(Icons.camera_enhance_outlined, size: 25),
            ),
          ],
          bottom: TabBar(
            labelPadding: EdgeInsets.only(bottom: 5),
            indicatorWeight: 4,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey.shade600,
            tabs: [
              Text('Created', style: TextStyle(color: Colors.white, fontSize: 16)),
              Text('Assigned', style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ),
        drawer: SideDrawer(context),
        body: TabBarView(
          children: [
            Tab(
              child: ListView(
                children: [
                  ProjectCard(project: AppData.projects[0]),
                  ProjectCard(project: AppData.projects[1]),
                  ProjectCard(project: AppData.projects[1]),
                ],
              ),
            ),
            Tab(
              child: ListView(
                children: [
                  ProjectCard(project: AppData.projects[0]),
                  ProjectCard(project: AppData.projects[1]),
                  ProjectCard(project: AppData.projects[1]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
