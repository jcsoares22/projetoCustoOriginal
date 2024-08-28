import 'package:flutter/material.dart';
import 'package:projetocusto/components/app_drawer.dart';
import 'package:projetocusto/components/box_deracation.dart';
import 'package:projetocusto/components/config.dart';

class PesqDespesas extends StatefulWidget {
  const PesqDespesas({super.key});

  @override
  State<PesqDespesas> createState() => _PesqDespesasState();
}

class _PesqDespesasState extends State<PesqDespesas> {
  final _decoracao = BoxDeracation().decoracao;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisar despesas'),
        actions: const [Config()],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: _decoracao,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Nome da despesa',
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                focusColor: Colors.amber,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
