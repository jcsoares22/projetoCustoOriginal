import 'dart:math';
import 'package:projetocusto/components/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:projetocusto/model/produto.dart';
import 'dart:convert';
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

  Future<void> _submitForm() async {
    final response = await http.post(
      Uri.parse('http://192.168.2.102:5000/save_data'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'CODIGO': _codigoController,
        'DESCRICAO': _descricaoController,
        'COR': 'HOJE',
        'VALOR_PRODUTO': 'HOJE',
        'FOTO': 'T', // Ajuste conforme necessário
        'PERC_LUCRO': 'T', // Ajuste conforme necessário
        'PERC_LUCRO2': 'F', // Ajuste conforme necessário
        'PERC_LUCRO3': 'T', // Ajuste conforme necessário
        'COD_MARKETPLACE': 'F', // Ajuste conforme necessário
        'CUSTO_TOTAL': 'F', // Ajuste conforme necessário
        'CUSTO_TOTAL_VENDA': 'T', // Ajuste conforme necessário
        'FRETE': 'F', // Ajuste conforme necessário
        'CUSTO_TOTAL_DESPESA': 'T', // Ajuste conforme necessário
        'VLR1': 'T', // Ajuste conforme necessário
        'VLR2': 'T', // Ajuste conforme necessário
        'VLR3': 'T', // Ajuste conforme necessário
      }),
    );

    if (response.statusCode == 200) {
      // Sucesso ao salvar os dados
      print('Dados salvos com sucesso');
    } else {
      // Falha ao salvar os dados
      print(
          'Falha ao salvar os dados: ${response.statusCode} - ${response.body}');
    }
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
