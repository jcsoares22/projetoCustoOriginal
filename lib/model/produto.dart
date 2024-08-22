import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projetocusto/utils/constants.dart';

class Produto with ChangeNotifier {
  final String id;
  final String nome;
  final String descricao;
  final double preco;
  final String imageUrl;
  final double precoVenda;
  bool isFavorite;

  Produto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.imageUrl,
    required this.precoVenda,
    this.isFavorite = false,
  });

  void _toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> toggleFavorite(String _token, String userId) async {
    try {
      _toggleFavorite();
      final response = await http.put(
        Uri.parse(
          '${Constants.PRODUCT_BASE_URL}.json?auth=$_token',
        ),
        body: jsonEncode(isFavorite),
      );

      if (response.statusCode >= 400) {
        _toggleFavorite();
      }
    } catch (_) {
      _toggleFavorite();
    }
  }
}
