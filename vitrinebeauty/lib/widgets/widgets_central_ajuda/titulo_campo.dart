import 'package:flutter/material.dart';

class TituloCampo extends StatelessWidget {
  final double altura;
  final String campo;
  final int tamanhoFonte;
  const TituloCampo(this.altura, this.campo, {Key? key})
      : tamanhoFonte = 0,
        super(key: key);
  const TituloCampo.edit(this.altura, this.campo, this.tamanhoFonte, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: altura * 0.02, left: altura * 0.5),
        child: Text(
          campo,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
