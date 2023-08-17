import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/todo_cubit.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key, required this.title});

  final String title;

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<TodoCubit>();
      cubit.fetchToDo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TodoSuccess) {
            final todos = state.todos;
            return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];

                  return ListTile(
                    title: Text(todo.title),
                  );
                });
          } else if (state is TodoError) {
            return Center(
                child: Text(
              state.message,
              style: const TextStyle(fontSize: 22),
            ));
          }
          return Center(
              child: Text(
            state.toString(),
            style: const TextStyle(fontSize: 22),
          ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            final cubit = context.read<TodoCubit>();
            cubit.fetchToDo();
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
