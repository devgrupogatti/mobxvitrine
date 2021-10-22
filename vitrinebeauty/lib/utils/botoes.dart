import 'package:flutter/material.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/view/recuper_senha.dart';

class BotoesDart {
  Widget botaoTexto(
      String nomeDoBotao,
      String corDoBotao,
      double tamanhoDaFonte,
      FontStyle formato,
      AlignmentGeometry posicaoRelativaDaTela,
      BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecuperarSenha(),
            ),
          );
        },
        child: Text(
          nomeDoBotao,
          style: TextStyle(
            color: HexColor(corDoBotao),
            fontStyle: formato,
            fontSize: tamanhoDaFonte,
          ),
        ),
      ),
    );
  }
}
