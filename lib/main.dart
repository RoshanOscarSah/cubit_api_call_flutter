import 'package:cubit_api_call/todo/data/repository/todo_repository.dart';
import 'package:cubit_api_call/todo/presentation/cubit/todo_cubit.dart';
import 'package:cubit_api_call/todo/presentation/views/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => TodoCubit(TodoRepository()),
        child: const TodoPage(title: 'Cubit api call'),
      ),
    );
  }
}
