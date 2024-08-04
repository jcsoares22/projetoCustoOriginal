import 'package:projetocusto/utils/app_routes.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBar(
            title: Text('Menu'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            }),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.production_quantity_limits),
            title: Text('MarketPlace'),
            onTap: (() {
              Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.MARKETPLACES);
            }),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Produtos'),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed(AppRoutes.PRODUTOS);
            }),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add_chart_sharp),
            title: Text('Despesas'),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed(AppRoutes.DESPESAS);
            }),
          ),
        ],
      ),
    );
  }
}
