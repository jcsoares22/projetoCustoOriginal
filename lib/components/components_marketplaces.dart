
import 'package:flutter/material.dart';

class ComponentsMarketplaces extends StatefulWidget {
  @override
  _ComponentsMarketplacesState createState() => _ComponentsMarketplacesState();
}

class _ComponentsMarketplacesState extends State<ComponentsMarketplaces> {
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
         
        ),
      ),
    );
  }
}