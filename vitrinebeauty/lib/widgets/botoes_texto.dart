// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, unnecessary_this

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/view/recuper_senha.dart';

class BotoesTexto extends StatelessWidget {
  //const BotoesTexto({ Key? key }) : super(key: key);
  String nomeDoBotao;
  String corDoBotao;
  double tamanhoDaFonte;
  EdgeInsets recuo;
  FontStyle formatoStyle;
  FontWeight formatoWeight;
  AlignmentGeometry posicaoRelativaDaTela;
  BuildContext context;

  BotoesTexto.style(this.nomeDoBotao, this.corDoBotao, this.tamanhoDaFonte,
      this.recuo, this.formatoStyle, this.posicaoRelativaDaTela, this.context)
      : this.formatoWeight = FontWeight.bold;
  BotoesTexto.bold(this.nomeDoBotao, this.corDoBotao, this.tamanhoDaFonte,
      this.recuo, this.formatoWeight, this.posicaoRelativaDaTela, this.context)
      : this.formatoStyle = FontStyle.normal;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: recuo,
      alignment: posicaoRelativaDaTela,
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecuperarSenha(),
            ),
          );
        },
        child: Text(nomeDoBotao,
            style: formatoStyle.toString().isEmpty
                ? TextStyle(
                    color: HexColor(corDoBotao),
                    fontSize: tamanhoDaFonte,
                    fontStyle: formatoStyle,
                  )
                : TextStyle(
                    color: HexColor(corDoBotao),
                    fontSize: tamanhoDaFonte,
                    fontWeight: FontWeight.bold,
                  )),
      ),
    );
  }
}
