import 'package:flutter/material.dart';

class TextoEndereco extends StatelessWidget {
  final double alturaPadding;
  final String endereco;
  const TextoEndereco(this.endereco, this.alturaPadding, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Text('Endereço atual:'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: alturaPadding * 0.1, horizontal: alturaPadding * 0.1),
            child: Text(
              endereco,
              style: const TextStyle(fontSize: 15),
              maxLines: 3,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text('Endereços recentes:'),
          ),
        ],
      ),
    );
  }
}
