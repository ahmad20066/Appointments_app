import 'package:appointments/features/wishlist/providers/wishlist_provider.dart';
import 'package:appointments/features/wishlist/widgets/wishlist_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatelessWidget {
  static const routeName = '/wishlist';
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WishList"),
      ),
      body: FutureBuilder(
          future: Provider.of<WishListProvider>(context, listen: false)
              .getWishList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                itemCount: Provider.of<WishListProvider>(context, listen: false)
                    .wishList
                    .length,
                itemBuilder: (context, index) {
                  return WishlistCard(
                      item:
                          Provider.of<WishListProvider>(context, listen: false)
                              .wishList[index]);
                });
          }),
    );
  }
}
