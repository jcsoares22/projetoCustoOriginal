import 'package:projetocusto/components/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:projetocusto/components/box_deracation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _decoracao = BoxDeracation().decoracao;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina inicial'),
        actions: const [
          Padding(padding: EdgeInsets.all(20)),
          DropdownMenuItem(
            value: 'Config',
            child: Row(
              children: [
                Icon(
                  Icons.exit_to_app,
                  color: Colors.black87,
                ),
                SizedBox(width: 10),
                Text('Configurações'),
              ],
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            decoration: _decoracao,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'nome produto',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                      focusColor: Colors.amber,
                    ),
                  ),
                ),
                Divider(),
                ListBody(),
              ],
            )),
      ),
    );
    Divider();
  }
}
