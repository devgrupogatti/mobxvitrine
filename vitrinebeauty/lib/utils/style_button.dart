// ignore: file_names
import 'package:flutter/material.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';

class StyleButton {
  ButtonStyle estiloBotao(
      String corDeFundo, String corDoTexto, double tamHorizontal,
      {double tamVertival = 0.0}) {
    return ElevatedButton.styleFrom(
      onPrimary: HexColor(corDoTexto),
      primary: HexColor(corDeFundo).withOpacity(0.9),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(29)),
      ),
    );
  }
}
