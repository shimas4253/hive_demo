import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_demo/db/functions/db_functions.dart';

import '../../db/models/data_models.dart';

class studentListWidget extends StatelessWidget {
  const studentListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (BuildContext cntx, List<StudentModel>studentList, Widget? child) {
        return ListView.separated(
            itemBuilder: (cntx, index) {
              final data=studentList[index];
              return ListTile(
                trailing: IconButton(onPressed: (){
                  if(data.id !=null){
                    deleteStudents(data.id!);
                  }else{
                    print('dont have an id');
                  }
                }, icon: Icon(Icons.delete)),
                title: Text(data.name),
                subtitle: Text(data.age),
              );
            },
            separatorBuilder: (cntx, index) {
              return Divider();
            },
            itemCount: studentList.length);
      },
    );
  }
}
