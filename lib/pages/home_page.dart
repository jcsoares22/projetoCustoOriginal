import 'package:projetocusto/components/app_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina inicial'),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Container(
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
