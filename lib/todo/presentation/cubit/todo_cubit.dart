import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubit_api_call/todo/data/repository/todo_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository _repository; // accesss to the repository
  TodoCubit(this._repository) : super(TodoInitial());

  Future<void> fetchToDo() async {
    emit(TodoLoading());
    try {
      final response = await _repository.getAll();
      emit(TodoSuccess(response));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }
}
