import 'package:flutter/material.dart';
import 'package:projetocusto/utils/app_routes.dart';

class Config extends StatelessWidget {
  const Config({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String result) {
        if (result == 'Config') {
          Navigator.of(context).pushNamed(AppRoutes.PREFERENCIA);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'Config',
          child: Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.black87,
              ),
              SizedBox(width: 10),
              Text('Configurações'),
            ],
          ),
        ),
      ],
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Icon(Icons.more_vert),
      ),
    );
  }
}
