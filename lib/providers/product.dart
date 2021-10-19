import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleFavoriteStatus(String token) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();

    void _setFavValue(bool newValue) {
      isFavorite = newValue;
      notifyListeners();
    }

    final url = Uri.parse(
        'https://flutter-shop-3c1d3-default-rtdb.europe-west1.firebasedatabase.app/products/$id.json?auth=$token');
    try {
      final response = await http.patch(url, body: json.encode({
        'isFavorite': isFavorite,
      }));

      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (error) {
      _setFavValue(oldStatus);
    }
  }
}