import 'package:pomodore/core/services/database/storage.dart';
import 'package:pomodore/features/task_management/domain/entities/task_entity.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/resources/params/timer_state_params.dart';

class TimerLocalDataSource {
  final Database db;

  TimerLocalDataSource(this.db);

  Future<int?> saveTimerState(TimerStateParams stateParams) async {
    int? result;
    try {
      await FStorage.write(FStorage.timerStateKey, stateParams.duration);
      await FStorage.write(FStorage.timerStateDateTimeKey, DateTime.now());
      await FStorage.write(
          FStorage.timerStateBaseDurationKey, stateParams.baseDuration);
      await FStorage.write(FStorage.taskIdKey, stateParams.task.id);
      result = stateParams.duration;
    } catch (e) {
      rethrow;
    }
    return result;
  }

  Future<Map<String, dynamic>> getTaskById(String id) async {
    return {};
  }

  Future<TimerStateRestoreParams?> restoreTimerState() async {
    TimerStateRestoreParams? result;
    try {
      var state = await FStorage.read(FStorage.timerStateKey);
      var dateTimeState = await FStorage.read(FStorage.timerStateDateTimeKey);
      var baseStateDuration =
          await FStorage.read(FStorage.timerStateBaseDurationKey);
      String? id = await FStorage.read(FStorage.taskIdKey);

      if (state != null &&
          dateTimeState != null &&
          baseStateDuration != null &&
          id != null) {
        DateTime restoredDateTime = DateTime.parse(dateTimeState);
        DateTime now = DateTime.now();
        Duration remainDuration = now.difference(restoredDateTime);
        Map<String, dynamic> task = await getTaskById(id);

        if (remainDuration.inSeconds < int.parse(state)) {
          result = TimerStateRestoreParams(
            duration: int.parse(state) - remainDuration.inSeconds,
            baseDuration: int.parse(baseStateDuration),
            task: task,
          );
        }
      }
    } catch (e) {
      rethrow;
    }
    return result;
  }
}
