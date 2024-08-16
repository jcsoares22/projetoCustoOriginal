import 'package:projetocusto/components/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:projetocusto/components/box_deracation.dart';

class Despesas extends StatefulWidget {
  const Despesas({super.key});

  @override
  State<Despesas> createState() => _DespesasState();
}

class _DespesasState extends State<Despesas> {
  final _codigoController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _valorDespesaController = TextEditingController(); // Adicionei o controller para valor despesa
  final _decoracao = BoxDeracation().decoracao;

  @override
  void dispose() {
    _codigoController.dispose();
    _descricaoController.dispose();
    _valorDespesaController.dispose(); // Dispose do controller adicionado
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas'),
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                 
                decoration: _decoracao,
                child: TextFormField(
                  cursorWidth: 50,
                  controller: _codigoController,
                  decoration: const InputDecoration(labelText: 'Código'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o código';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(width: 10), // Espaço entre os campos
            Expanded(
              flex: 5,
              child: Container(
                decoration: _decoracao,
                child: TextFormField(
                  controller: _descricaoController,
                  decoration:
                      const InputDecoration(labelText: '          Descrição'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a Descrição';
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Container(
                decoration: _decoracao,
                child: TextFormField(
                  controller: _valorDespesaController,
                  decoration:
                      const InputDecoration(labelText: '  Valor despesa'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o Valor da despesa';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
