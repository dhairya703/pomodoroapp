import 'package:flutter_test/flutter_test.dart';
import 'package:pomodore/core/utils/utils.dart';

void main() {
  group("Utils", () {
    test("Test sec to formatted min:sec", () {
      var formatterTime = Utils.formatSecToMinSec(timeInSecond: 90);
      expect(formatterTime, "01 : 30");
    });

    test("Test unique id generator", () {
      var firstId = Utils.createUniqueId();
      var secondId = Utils.createUniqueId();

      expect(firstId != secondId, true);
    });

    test("Test check date is today method", () {
      bool today = Utils.checkDateIsToday(DateTime.now());

      expect(today, true);
    });

    test("Test pomodoro timer calculator", () {
      int time = Utils.calculatePomodoroTime(120, 20);

      expect(time, 100);
    });

    test("Test get name of month", () {
      String name = Utils.monthNameOfDateTime(DateTime(1998, 4, 1).toString());

      expect(name, "April");
    });

    test("Test time to formatted yyyy MM dd", () {
      var dateTime = DateTime(1998, 1, 1);
      var formatterTime = Utils.formatDateToYYYYMMDD(dateTime);
      var result =
          Utils.formatDateToYYYYMMDD(dateTime.add(const Duration(days: 1)));

      expect(result, "1998-01-02");
    });
  });
}
