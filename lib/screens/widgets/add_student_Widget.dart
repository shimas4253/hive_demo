import 'package:flutter/material.dart';
import 'package:hive_demo/db/functions/db_functions.dart';
import 'package:hive_demo/db/models/data_models.dart';

class addStudentWidget extends StatelessWidget {
  addStudentWidget({Key? key}) : super(key: key);
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          textInputAction: TextInputAction.next,
          controller: _nameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Name',
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          textInputAction: TextInputAction.next,
          controller: _ageController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Age',
          ),
        ),
        ElevatedButton.icon(
            onPressed: () {
              buttonClicked();
            },
            icon: Icon(Icons.add),
            label: Text('add Student'))
      ],
    );
  }
  Future<void> buttonClicked()async{
    final _name=_nameController.text;
    final _age=_ageController.text;
    if(_name.isEmpty||_age.isEmpty){
      return;
    }
   final _student= StudentModel(name: _name, age: _age);
    addStudent(_student);
  }
}
