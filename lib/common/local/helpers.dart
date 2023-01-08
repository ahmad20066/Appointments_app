import 'package:appointments/features/profile/widgets/appointment_card.dart';
import 'package:intl/intl.dart';

class Helpers {
  static String capitalize(String text) {
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  static apState calculateDate(String day, String end_time) {
    Map<String, int> days = {
      'sunday': 1,
      "monday": 2,
      "tuesday": 3,
      "wednesday": 4,
      "thursday": 5,
      "friday": 6,
      "saturday": 7,
    };

    String today = DateFormat("EEEE").format(DateTime.now());

    today = today[0].toLowerCase() + today.substring(1).toLowerCase();

    final now = DateTime.now();
    final endDate = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(end_time.substring(0, 1)),
        int.parse(end_time.substring(3, 4)),
        int.parse(end_time.substring(6, 7)));

    if (days[day]! > days[today]!) {
      return apState.done;
    } else if (days[day]! == days[today]! && now.isBefore(endDate)) {
      return apState.upcoming;
    } else if (days[day]! == days[today]! && now.isAfter(endDate)) {
      return apState.done;
    } else if (days[day]! < days[today]!) {
      return apState.upcoming;
    } else {
      throw Exception('error date');
    }
  }
}
