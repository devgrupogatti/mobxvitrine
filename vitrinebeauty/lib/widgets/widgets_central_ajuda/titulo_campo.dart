import 'package:flutter/material.dart';

class TituloCampo extends StatelessWidget {
  final double altura;
  final String campo;
  const TituloCampo(this.altura, this.campo, {Key? key}) : super(key: key);

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
            fontSize: 14,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }
}
