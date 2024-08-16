import 'package:flutter/material.dart';
import 'package:projetocusto/components/app_drawer.dart';
import 'package:projetocusto/components/config.dart';

class Preferencias extends StatefulWidget {
  const Preferencias({super.key});

  @override
  State<Preferencias> createState() => _PreferenciasState();
}

class _PreferenciasState extends State<Preferencias> {
  bool _isChecked = false; // Estado do checkbox
  final TextEditingController _controller =
      TextEditingController(); // Controlador do TextField
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina inicial'),
      ),
      drawer: const AppDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Checkbox(
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
              ),
              Expanded(
                // Para que o TextField use o espaço disponível
                child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Percendo de lucro desejado',
                      border: OutlineInputBorder(),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
