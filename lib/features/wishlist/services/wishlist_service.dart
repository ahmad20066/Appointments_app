import 'dart:convert';

import 'package:appointments/constants/end_points.dart';
import 'package:appointments/models/wishlist/wishlist_item.dart';

import '../../../common/local/network.dart';
import 'package:http/http.dart' as http;

class WishlistService {
  getWishlist() async {
    try {
      final url = Uri.parse(EndPoints.wishlist);
      final headers = Network.getheaders();
      final response = await http.get(url, headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final wishlist = (jsonResponse['wishlist'] as List)
            .map((e) => WishListItem.fromMap(e))
            .toList();
        return wishlist;
      } else {
        throw Exception('Error Wishlist');
      }
    } catch (e) {
      rethrow;
    }
  }

  addToWishlist(int expertId) async {
    try {
      final url = Uri.parse(EndPoints.addWishlist);
      final headers = Network.getheaders();
      final response = await http.post(url,
          headers: headers, body: {"expert_id": expertId.toString()});
      print(response.body);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
