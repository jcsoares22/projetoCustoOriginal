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

  Future<void> submitData() async {
    final response = await http.post(
      Uri.parse('http://192.168.2.102:5000/save_data'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'CODIGO': 150,
        'DESCRICAO': 'HOJE',
        'COR': 'HOJE',
        'VALOR_PRODUTO': 'HOJE',
        'FOTO': 'T', // Ajuste conforme necessário
        'PERC_LUCRO': 'T', // Ajuste conforme necessário
        'PERC_LUCRO2': 'F', // Ajuste conforme necessário
        'PERC_LUCRO3': 'T', // Ajuste conforme necessário
        'COD_MARKETPLACE': 'F', // Ajuste conforme necessário
        'CUSTO_TOTAL': 'F', // Ajuste conforme necessário
        'CUSTO_TOTAL_VENDA': 'T', // Ajuste conforme necessário
        'FRETE': 'F', // Ajuste conforme necessário
        'CUSTO_TOTAL_DESPESA': 'T', // Ajuste conforme necessário
        'VLR1': 'T', // Ajuste conforme necessário
        'VLR2': 'T', // Ajuste conforme necessário
        'VLR3': 'T', // Ajuste conforme necessário
      }),
    );

    if (response.statusCode == 200) {
      // Sucesso ao salvar os dados
      print('Dados salvos com sucesso');
    } else {
      // Falha ao salvar os dados
      print(
          'Falha ao salvar os dados: ${response.statusCode} - ${response.body}');
    }
  }


  
}
