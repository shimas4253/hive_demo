import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_demo/screens/home_page.dart';
import 'package:hive_flutter/adapters.dart';

import 'db/models/data_models.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId)){
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homePage(),
    );
  }
}
