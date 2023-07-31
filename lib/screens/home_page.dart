import 'package:flutter/material.dart';
import 'package:hive_demo/db/functions/db_functions.dart';
import 'package:hive_demo/screens/widgets/add_student_Widget.dart';
import 'package:hive_demo/screens/widgets/student_list.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [addStudentWidget(), const Expanded(child: studentListWidget())],
        ),
      ),
    );
  }
}
