import 'dart:convert';
import 'dart:math';

import 'package:projetocusto/components/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:projetocusto/model/produto.dart';
import 'package:projetocusto/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  final _codigoController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _formData = <String, Object>{};
  final _imageUrlController = TextEditingController();
  final _imageUrlFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _isLoanding = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      final arg = ModalRoute.of(context)?.settings.arguments;

      if (arg != null) {
        final product = arg as Produto;

        _formData['id'] = product.id;
        _formData['nome'] = product.nome;
        _formData['preco'] = product.preco;
        _formData['descricao'] = product.descricao;
        _formData['precoVenda'] = product.precoVenda;
        _formData['imageUrl'] = product.imageUrl;

        _imageUrlController.text = product.imageUrl;
      }
    }
  }

  Future _submitForm() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
  }
  // _formKey.currentState?.save();

  Future<void> addProduct(Produto produto) async {
    final future = http.post(
      Uri.parse('${Constants.PRODUCT_BASE_URL}.json?produto'),
      body: jsonEncode(
        {
          "name": produto.nome,
          "Descricao": produto.descricao,
          "preço": produto.preco,
          "imageUrl": produto.imageUrl,
          "precoVenda": produto.precoVenda
        },
      ),
    );
  }

  bool isValidadImageURL(String url) {
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    bool endsWithFile = url.toLowerCase().endsWith('.png') ||
        url.toLowerCase().endsWith('.jpag') ||
        url.toLowerCase().endsWith('.jpg');
    return isValidUrl && endsWithFile;
  }

  @override
  void dispose() {
    _codigoController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          IconButton(
            onPressed: _submitForm,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: Scaffold(
        key: _formKey,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        initialValue: _formData['nome']?.toString(),
                        controller: _codigoController,
                        decoration: const InputDecoration(labelText: 'Código'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira o código';
                          }
                          return null;
                        },
                        onSaved: (name) => _formData['nome'] = name ?? '',
                      ),
                    ),
                    SizedBox(width: 10), // Espaço entre os campos
                    Expanded(
                      flex: 10,
                      child: TextFormField(
                        controller: _descricaoController,
                        decoration:
                            const InputDecoration(labelText: 'Descrição'),
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
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: _codigoController,
                        decoration:
                            const InputDecoration(labelText: 'Preço Custo'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira o Preço Custo';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10), // Espaço entre os campos
                    Expanded(
                      child: TextFormField(
                        controller: _descricaoController,
                        decoration:
                            const InputDecoration(labelText: 'Preço venda'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira o preço venda';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Url da Imagem'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.url,
                  //textInputAction: TextInputAction.done,
                  //  textDirection: TextInputAction.done,
                  focusNode: _imageUrlFocus,
                  controller: _imageUrlController,
                  onFieldSubmitted: (_) => _submitForm,
                  onSaved: (imageUrl) =>
                      _formData['imageUrl'] = imageUrl ?? ' ',

                  validator: (_imageUrl) {
                    final imageUrl = _imageUrl ?? '';
                    if (!isValidadImageURL(imageUrl)) {
                      return 'Informe uma Url Valida!';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                alignment: Alignment.center,
                child: _imageUrlController.text.isEmpty
                    ? Text('informe a Url')
                    : Image.network(
                        _imageUrlController.text,
                        fit: BoxFit.cover,
                      ),
              ),

              SizedBox(height: 10), // Espaço entre as linhas de formulário
            ],
          ),
        ),
      ),
    );
  }
}
