part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class TodoLoading extends TodoState {}

final class TodoSuccess extends TodoState {
  final List<Todo> todos;
  TodoSuccess(this.todos);
}

final class TodoError extends TodoState {
  final String message;
  TodoError(this.message);
}
