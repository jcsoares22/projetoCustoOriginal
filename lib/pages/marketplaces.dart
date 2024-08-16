import 'package:projetocusto/components/app_drawer.dart';
import 'package:projetocusto/components/buttons.dart';
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
    // Dispose dos controllers quando o widget for removido
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
        title: const Text('Marketplaces'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Buttons(),
              _validarCampos(
                controller: _codigoController,
                label: 'Código',
                validatorMessage: 'Por favor, insira o código',
                keyboardType: TextInputType.number,
              ),
              _validarCampos(
                controller: _empresaController,
                label: 'Empresa',
                validatorMessage: 'Por favor, insira a empresa',
              ),
              _validarCampos(
                controller: _comissaoController,
                label: 'Comissão Valor Ferte',
                validatorMessage: 'Por favor, insira a comissão',
                keyboardType: TextInputType.number,
              ),
              _validarCampos(
                controller: _taxaFixaController,
                label: 'Taxa Fixa',
                validatorMessage: 'Por favor, insira a taxa fixa',
                keyboardType: TextInputType.number,
              ),
              _validarCampos(
                controller: _descontoMarketplaceController,
                label: 'Desconto Marketplace',
                validatorMessage: 'Por favor, insira o desconto do marketplace',
                keyboardType: TextInputType.number,
              ),
              _validarCampos(
                controller: _descontoSellerController,
                label: 'Desconto Seller',
                validatorMessage: 'Por favor, insira o desconto do seller',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Se o formulário for válido, exiba uma snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processando Dados')),
                    );
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _validarCampos({
    required TextEditingController controller,
    required String label,
    required String validatorMessage,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorMessage;
        }
        return null;
      },
      keyboardType: keyboardType,
    );
  }
  
}
