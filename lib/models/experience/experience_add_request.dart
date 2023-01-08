class ExperienceAddRequest {
  final String title;
  final String description;
  final String years;

  ExperienceAddRequest(
      {required this.title, required this.description, required this.years});
  Map<String, dynamic> toJson() {
    print(years.runtimeType);
    print(description.runtimeType);
    print(title.runtimeType);
    return {
      "title": title,
      "description": description,
      "years": years.toString()
    };
  }
}
