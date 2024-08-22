import 'package:flutter/material.dart';
import 'package:projetocusto/feature/despesas/despesas.dart';
import 'package:projetocusto/feature/despesas/pesq_despesas.dart';
import 'package:projetocusto/feature/principal/home_page.dart';
import 'package:projetocusto/feature/marketplaces/marketplaces.dart';
import 'package:projetocusto/feature/preferencia/preferencias.dart';
import 'package:projetocusto/feature/produto/form_produtos.dart';

class AppRoutes {
  static const HOME = '/';
  static const MARKETPLACES = '/marketplaces';
  static const PRODUTOS = '/produtos';
  static const DESPESAS = '/despesas';
  static const PREFERENCIA = '/preferencia';
  static const PESQ_DESPESAS = '/pesq_despesas';

  static Map<String, Widget Function(dynamic ctx)> getroutes = {
    AppRoutes.HOME: (ctx) => const HomePage(),
    AppRoutes.MARKETPLACES: (ctx) => const Marketplaces(),
    AppRoutes.PRODUTOS: (ctx) => const FormProdutos(),
    AppRoutes.DESPESAS: (ctx) => const Despesas(),
    AppRoutes.PREFERENCIA: (ctx) => const Preferencias(),
    AppRoutes.PESQ_DESPESAS: (ctx) => const PesqDespesas(),
  };
}
