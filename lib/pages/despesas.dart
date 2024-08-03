import 'package:custo/components/app_drawer.dart';
import 'package:custo/components/buttons.dart';
import 'package:flutter/material.dart';

class Despesas extends StatefulWidget {
  const Despesas({super.key});

  @override
  State<Despesas> createState() => _DespesasState();
}

class _DespesasState extends State<Despesas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas'),
      ),
      drawer: AppDrawer(),
      body: Buttons(),
    );
  }
}
