// Mocks generated by Mockito 5.4.0 from annotations
// in pomodore/test/features/task_management/presentation/blocs/tasks_bloc/tasks_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pomodore/core/resources/params/no_params.dart' as _i8;
import 'package:pomodore/core/resources/params/save_pomodoro_params.dart'
    as _i12;
import 'package:pomodore/features/task_management/domain/entities/pomodoro_entity.dart'
    as _i14;
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart'
    as _i6;
import 'package:pomodore/features/task_management/domain/repositories/task_repository.dart'
    as _i3;
import 'package:pomodore/features/task_management/domain/usecases/add_pomodoro_to_db_usecase.dart'
    as _i11;
import 'package:pomodore/features/task_management/domain/usecases/add_task_usecase.dart'
    as _i4;
import 'package:pomodore/features/task_management/domain/usecases/complete_task_usecase.dart'
    as _i9;
import 'package:pomodore/features/task_management/domain/usecases/delete_task_usecase.dart'
    as _i10;
import 'package:pomodore/features/task_management/domain/usecases/edit_task_usecase.dart'
    as _i13;
import 'package:pomodore/features/task_management/domain/usecases/get_all_tasks.dart'
    as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTaskRepository_1 extends _i1.SmartFake
    implements _i3.TaskRepository {
  _FakeTaskRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDateTime_2 extends _i1.SmartFake implements DateTime {
  _FakeDateTime_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AddTaskUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddTaskUsecase extends _i1.Mock implements _i4.AddTaskUsecase {
  MockAddTaskUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<String, bool>> call({_i6.TaskEntity? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#params: params},
        ),
        returnValue: _i5.Future<_i2.Either<String, bool>>.value(
            _FakeEither_0<String, bool>(
          this,
          Invocation.method(
            #call,
            [],
            {#params: params},
          ),
        )),
      ) as _i5.Future<_i2.Either<String, bool>>);
}

/// A class which mocks [GetAllTasksUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllTasksUseCase extends _i1.Mock
    implements _i7.GetAllTasksUseCase {
  MockGetAllTasksUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<String, List<_i6.TaskEntity>>> call(
          {_i8.NoParams? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#params: params},
        ),
        returnValue: _i5.Future<_i2.Either<String, List<_i6.TaskEntity>>>.value(
            _FakeEither_0<String, List<_i6.TaskEntity>>(
          this,
          Invocation.method(
            #call,
            [],
            {#params: params},
          ),
        )),
      ) as _i5.Future<_i2.Either<String, List<_i6.TaskEntity>>>);
}

/// A class which mocks [CompleteTaskUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockCompleteTaskUseCase extends _i1.Mock
    implements _i9.CompleteTaskUseCase {
  MockCompleteTaskUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<String, String>> call({_i6.TaskEntity? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#params: params},
        ),
        returnValue: _i5.Future<_i2.Either<String, String>>.value(
            _FakeEither_0<String, String>(
          this,
          Invocation.method(
            #call,
            [],
            {#params: params},
          ),
        )),
      ) as _i5.Future<_i2.Either<String, String>>);
}

/// A class which mocks [DeleteTaskUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteTaskUseCase extends _i1.Mock implements _i10.DeleteTaskUseCase {
  MockDeleteTaskUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<String, String>> call({String? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#params: params},
        ),
        returnValue: _i5.Future<_i2.Either<String, String>>.value(
            _FakeEither_0<String, String>(
          this,
          Invocation.method(
            #call,
            [],
            {#params: params},
          ),
        )),
      ) as _i5.Future<_i2.Either<String, String>>);
}

/// A class which mocks [AddPomodoroToDbUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddPomodoroToDbUseCase extends _i1.Mock
    implements _i11.AddPomodoroToDbUseCase {
  MockAddPomodoroToDbUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<String, bool>> call(
          {_i12.SavePomodoroParams? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#params: params},
        ),
        returnValue: _i5.Future<_i2.Either<String, bool>>.value(
            _FakeEither_0<String, bool>(
          this,
          Invocation.method(
            #call,
            [],
            {#params: params},
          ),
        )),
      ) as _i5.Future<_i2.Either<String, bool>>);
}

/// A class which mocks [EditTaskUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockEditTaskUseCase extends _i1.Mock implements _i13.EditTaskUseCase {
  MockEditTaskUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.TaskRepository get taskRepository => (super.noSuchMethod(
        Invocation.getter(#taskRepository),
        returnValue: _FakeTaskRepository_1(
          this,
          Invocation.getter(#taskRepository),
        ),
      ) as _i3.TaskRepository);
  @override
  _i5.Future<_i2.Either<String, String>> call({_i6.TaskEntity? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#params: params},
        ),
        returnValue: _i5.Future<_i2.Either<String, String>>.value(
            _FakeEither_0<String, String>(
          this,
          Invocation.method(
            #call,
            [],
            {#params: params},
          ),
        )),
      ) as _i5.Future<_i2.Either<String, String>>);
}

/// A class which mocks [TaskEntity].
///
/// See the documentation for Mockito's code generation for more information.
class MockTaskEntity extends _i1.Mock implements _i6.TaskEntity {
  MockTaskEntity() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get id => (super.noSuchMethod(
        Invocation.getter(#id),
        returnValue: '',
      ) as String);
  @override
  String get title => (super.noSuchMethod(
        Invocation.getter(#title),
        returnValue: '',
      ) as String);
  @override
  String get description => (super.noSuchMethod(
        Invocation.getter(#description),
        returnValue: '',
      ) as String);
  @override
  String get category => (super.noSuchMethod(
        Invocation.getter(#category),
        returnValue: '',
      ) as String);
  @override
  DateTime get deadLineTime => (super.noSuchMethod(
        Invocation.getter(#deadLineTime),
        returnValue: _FakeDateTime_2(
          this,
          Invocation.getter(#deadLineTime),
        ),
      ) as DateTime);
  @override
  bool get done => (super.noSuchMethod(
        Invocation.getter(#done),
        returnValue: false,
      ) as bool);
  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
      ) as List<Object?>);
}

/// A class which mocks [PomodoroEntity].
///
/// See the documentation for Mockito's code generation for more information.
class MockPomodoroEntity extends _i1.Mock implements _i14.PomodoroEntity {
  MockPomodoroEntity() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get dateTime => (super.noSuchMethod(
        Invocation.getter(#dateTime),
        returnValue: '',
      ) as String);
  @override
  List<Object?> get props => (super.noSuchMethod(
        Invocation.getter(#props),
        returnValue: <Object?>[],
      ) as List<Object?>);
}
