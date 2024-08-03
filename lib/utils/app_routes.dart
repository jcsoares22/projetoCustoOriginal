import 'package:custo/pages/despesas.dart';
import 'package:custo/pages/home_page.dart';
import 'package:custo/pages/marketplaces.dart';
import 'package:custo/pages/produtos.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const HOME = '/';
  static const MARKETPLACES = '/marketplaces';
  static const PRODUTOS = '/produtos';
  static const DESPESAS = '/despesas';

  static Map<String, Widget Function(dynamic ctx)> getroutes = {
    AppRoutes.HOME: (ctx) => const HomePage(),
    AppRoutes.MARKETPLACES: (ctx) => const Marketplaces(),
    AppRoutes.PRODUTOS: (ctx) => const Produtos(),
    AppRoutes.DESPESAS: (ctx) => const Despesas(),
  };
}
