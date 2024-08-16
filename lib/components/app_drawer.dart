import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        const Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            }),
          ),
        const Divider(),
          ListTile(
            leading: Icon(Icons.production_quantity_limits),
            title: Text('MarketPlace'),
            onTap: (() {
              Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.MARKETPLACES);
            }),
          ),
        const Divider(),
          ListTile(
             leading: FaIcon(FontAwesomeIcons.shoePrints),
            title: Text('Produtos'),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed(AppRoutes.PRODUTOS);
            }),
          ),
        const Divider(),
          ListTile(
            leading: Icon(Icons.add_chart_sharp),
            title: Text('Despesas'),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed(AppRoutes.DESPESAS);
            }),
          ),
        const Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Prefêrencias'),
            onTap: (() {
              Navigator.of(context).pushReplacementNamed(AppRoutes.PREFERENCIA);
            }),
          ),
        ],
      ),
    );
  }
}
