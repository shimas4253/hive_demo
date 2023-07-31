import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/data_models.dart';

ValueNotifier<List<StudentModel>> studentListNotifier=ValueNotifier([]);
addStudent(StudentModel value)async{
  final studentDB=await Hive.openBox<StudentModel>('student_db');
  final _id= await studentDB.add(value);
  value.id=_id;

  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();

}
Future<void>getAllStudents()async{
  final studentDB= await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}
deleteStudents(int id)async{
final studentDB=await Hive.openBox<StudentModel>('student_db');
await studentDB.delete(id);
getAllStudents();
}