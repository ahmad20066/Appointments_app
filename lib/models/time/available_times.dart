class AvailableTime {
  final int id;
  final int user_id;
  final String day;
  final String start_time;
  final String end_time;
  bool isAvailable;

  AvailableTime(
      {required this.id,
      required this.day,
      required this.user_id,
      required this.start_time,
      required this.end_time,
      this.isAvailable = true});
  factory AvailableTime.fromMap(Map<String, dynamic> map) {
    return AvailableTime(
        id: map['id'],
        day: map['day'],
        user_id: map['user_id'],
        start_time: map['start_time'],
        end_time: map['end_time']);
  }
}
