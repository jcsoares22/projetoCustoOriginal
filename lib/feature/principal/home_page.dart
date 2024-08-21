import 'package:projetocusto/components/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:projetocusto/components/box_deracation.dart';
import 'package:projetocusto/components/config.dart';

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
        actions: const [Config()],
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            decoration: _decoracao,
            child: TextField(
                  decoration: InputDecoration(
                    labelText: 'nome produto'.padRight(120),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                      focusColor: Colors.amber,
                    ),
                  ),
                ),        
      ),
    ),
    );
  }
}
