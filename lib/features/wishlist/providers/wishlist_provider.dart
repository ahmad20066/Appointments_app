import 'package:appointments/features/wishlist/services/wishlist_service.dart';
import 'package:appointments/models/auth/user_model.dart';
import 'package:appointments/models/wishlist/wishlist_item.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier {
  List<WishListItem> wishList = [];
  getWishList() async {
    final _service = WishlistService();
    wishList = await _service.getWishlist();
    notifyListeners();
  }

  addToWishlist(int expertId) async {
    final _service = WishlistService();
    final success = await _service.addToWishlist(expertId);
    if (success) {
      await getWishList();
    }
    return success;
  }

  bool isInWishlist(int id) {
    return wishList.any((element) => element.id == id);
  }
}
