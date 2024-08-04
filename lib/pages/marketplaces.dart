import 'package:projetocusto/components/app_drawer.dart';
import 'package:projetocusto/components/buttons.dart';
import 'package:projetocusto/components/components_marketplaces.dart';
import 'package:flutter/material.dart';

class Marketplaces extends StatefulWidget {
  const Marketplaces({super.key});

  @override
  State<Marketplaces> createState() => _MarketplacesState();
}

class _MarketplacesState extends State<Marketplaces> {
  final _formKey = GlobalKey<FormState>();

  // Controllers para os campos do formulário
  final _codigoController = TextEditingController();
  final _empresaController = TextEditingController();
  final _comissaoController = TextEditingController();
  final _taxaFixaController = TextEditingController();
  final _descontoMarketplaceController = TextEditingController();
  final _descontoSellerController = TextEditingController();

  @override
  void dispose() {
    // Dispose os controllers quando o widget for removido
    _codigoController.dispose();
    _empresaController.dispose();
    _comissaoController.dispose();
    _taxaFixaController.dispose();
    _descontoMarketplaceController.dispose();
    _descontoSellerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Markettplaces'),
        ),
        drawer: const AppDrawer(),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Form(
              child: ListView(
            children: <Widget>[
              Buttons(),
              TextFormField(
                cursorWidth: 50,
                controller: _codigoController,
                decoration: InputDecoration(labelText: 'Código'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o código';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _empresaController,
                decoration: InputDecoration(labelText: 'Empresa'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a empresa';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _comissaoController,
                decoration: InputDecoration(labelText: 'Comissão Valor Ferte'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a comissão';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _taxaFixaController,
                decoration: const InputDecoration(labelText: 'Taxa Fixa'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a taxa fixa';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _descontoMarketplaceController,
                decoration: InputDecoration(labelText: 'Desconto Marketplace'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o desconto do marketplace';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _descontoSellerController,
                decoration: InputDecoration(labelText: 'Desconto Seller'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o desconto do seller';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Se o formulário for válido, exiba uma snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Processando Dados')),
                    );
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          )),
        ));
  }
}
