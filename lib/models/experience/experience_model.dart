class ExperienceModel {
  final int id;
  final int user_id;
  final String title;
  final String description;
  final double years;
  final DateTime created_at;
  final DateTime updated_at;

  ExperienceModel(
      {required this.id,
      required this.user_id,
      required this.title,
      required this.description,
      required this.years,
      required this.created_at,
      required this.updated_at});
  factory ExperienceModel.frommap(Map<String, dynamic> map) {
    return ExperienceModel(
        id: map['id'],
        user_id: map['user_id'],
        title: map['title'],
        description: map['description'],
        years: map['years'],
        created_at: map['created_at'],
        updated_at: map['updated_at']);
  }
}
