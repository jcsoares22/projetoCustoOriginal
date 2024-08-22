import 'package:projetocusto/components/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:projetocusto/model/produto.dart';

class FormProdutos extends StatefulWidget {
  const FormProdutos({super.key});

  @override
  State<FormProdutos> createState() => _FormProdutosState();
}

class _FormProdutosState extends State<FormProdutos> {
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
  //  _formKey.currentState?.save();

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
      ),
      drawer: const AppDrawer(),
      body: Scaffold(
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
