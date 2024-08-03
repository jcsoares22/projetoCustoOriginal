import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: Text('Novo'),
          ),
         const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('Editar'),
          ),
         const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('Excluir'),
          ),
         const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('Salvar'),
          ),
        ],
      ),
    );
  }
}
