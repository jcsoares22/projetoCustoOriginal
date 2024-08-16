import 'package:flutter/material.dart';
import 'package:projetocusto/pages/despesas.dart';
import 'package:projetocusto/pages/home_page.dart';
import 'package:projetocusto/pages/marketplaces.dart';
import 'package:projetocusto/pages/preferencias.dart';
import 'package:projetocusto/pages/produtos.dart';

class AppRoutes {
  static const HOME = '/';
  static const MARKETPLACES = '/marketplaces';
  static const PRODUTOS = '/produtos';
  static const DESPESAS = '/despesas';
  static const PREFERENCIA = '/preferencia';

  static Map<String, Widget Function(dynamic ctx)> getroutes = {
    AppRoutes.HOME: (ctx) => const HomePage(),
    AppRoutes.MARKETPLACES: (ctx) => const Marketplaces(),
    AppRoutes.PRODUTOS: (ctx) => const Produtos(),
    AppRoutes.DESPESAS: (ctx) => const Despesas(),
    AppRoutes.PREFERENCIA: (ctx) => const Preferencias(),
  };
}
