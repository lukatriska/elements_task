import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/pages/elements_list.dart';

import 'bloc/my_element_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyElementBloc()..add(FetchElements()),
      child: MaterialApp(
        title: 'Axles Test Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ElementsList(),
      ),
    );
  }
}
