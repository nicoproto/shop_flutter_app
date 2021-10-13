import 'package:flutter/material.dart';
// import 'package:shop_flutter_app/models/product.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(imageUrl, fit: BoxFit.cover,),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite),
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart),
        ),
      ),

    );
  }
}