class WishListItem {
  final int id;
  final String name;
  final String email;
  final String image;
  final String Phone_Number;
  final String address;
  final double rating;
  final String category;
  final String specialization;

  WishListItem(
      {required this.id,
      required this.name,
      required this.email,
      required this.image,
      required this.Phone_Number,
      required this.address,
      required this.rating,
      required this.category,
      required this.specialization});
  factory WishListItem.fromMap(Map<String, dynamic> map) {
    return WishListItem(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        image: map['image'],
        Phone_Number: map['Phone_Number'].toString(),
        address: map['address'],
        rating: map['rating'].toDouble(),
        category: map['category'],
        specialization: map['specialization']);
  }
}
