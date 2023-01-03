class ConsultationModel {
  final int id;
  final int userId;
  final String title;
  final String description;
  final double price;

  ConsultationModel(
      {required this.id,
      required this.userId,
      required this.title,
      required this.description,
      required this.price});
  factory ConsultationModel.frommap(Map<String, dynamic> map) {
    return ConsultationModel(
        id: map['id'],
        userId: map['userId'],
        title: map['title'],
        description: map['description'],
        price: map['price'].toDouble());
  }
}
