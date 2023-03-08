import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:pomodore/core/utils/ticker.dart';
import 'package:pomodore/features/task_management/domain/usecases/add_pomodoro_to_db_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/restore_timer_state_usecase.dart';
import 'package:pomodore/features/task_management/domain/usecases/save_timer_state_usecase.dart';
import 'package:pomodore/features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart';

import 'timer_bloc_test.mocks.dart';

@GenerateMocks([
  AddPomodoroToDbUseCase,
  RestoreTimerStateUseCase,
  SaveTimerStateUseCase,
])
void main() {
  group("Timer Bloc", () {
    late TimerBloc timerBloc;
    int duration = 60 * 25;

    setUp(() => timerBloc = TimerBloc(
          ticker: const Ticker(),
          addPomodoroToDbUseCase: MockAddPomodoroToDbUseCase(),
          restoreTimerStateUseCase: MockRestoreTimerStateUseCase(),
          saveTimerStateUseCase: MockSaveTimerStateUseCase(),
        ));

    blocTest(
      "emit [TimerInProcess] when start timer",
      build: () => timerBloc,
      act: (bloc) => bloc.add(TimerStarted(duration)),
      expect: () =>
          [StartTimerLoading(duration), StartTimerWithoutTaskFailure(duration)],
    );

    blocTest(
      "emit [TimerInitial] when reset timer",
      build: () => timerBloc,
      act: (bloc) => bloc.add(TimerReset()),
      expect: () => [TimerInitial(duration)],
    );
  });
}
