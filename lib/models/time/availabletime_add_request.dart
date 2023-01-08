class AvailableTimeAddRequest {
  final String day;
  final String start_time;
  final String end_time;

  AvailableTimeAddRequest(
      {required this.day, required this.start_time, required this.end_time});
  Map<String, String> toJson() {
    return {"day": day, "start_time": start_time, "end_time": end_time};
  }
}
