import 'package:flutter/material.dart';

class ComponenteProduto extends StatefulWidget {
  const ComponenteProduto({super.key});

  @override
  State<ComponenteProduto> createState() => _ComponenteProdutoState();
}

class _ComponenteProdutoState extends State<ComponenteProduto> {
  final _codigoController = TextEditingController();
  final _descricaoController = TextEditingController();

  @override
  void dispose() {
    _codigoController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
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
              ),
              SizedBox(width: 10), // Espaço entre os campos
              Expanded(
                child: TextFormField(
                  controller: _descricaoController,
                  decoration: const InputDecoration(labelText: 'Descrição'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a Descrição';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 10), // Espaço entre as linhas de formulário
        ],
      ),
    );
  }
}
