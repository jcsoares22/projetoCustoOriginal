import 'package:projetocusto/components/app_drawer.dart';
import 'package:projetocusto/components/buttons.dart';
import 'package:flutter/material.dart';

class Despesas extends StatefulWidget {
  const Despesas({super.key});

  @override
  State<Despesas> createState() => _DespesasState();
}

class _DespesasState extends State<Despesas> {
  final _codigoController = TextEditingController();
  final _descricaoController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _codigoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            TextFormField(
              cursorWidth: 50,
              controller: _codigoController,
              decoration: const InputDecoration(labelText: 'Código'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o código';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _descricaoController,
              decoration: const InputDecoration(labelText: 'Descrição'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a Descrição';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _descricaoController,
              decoration: const InputDecoration(labelText: 'Valor despesa'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a Valor despesa';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
