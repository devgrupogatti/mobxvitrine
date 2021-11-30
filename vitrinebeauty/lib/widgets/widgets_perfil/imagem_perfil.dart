import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';

class ImagemPerfil extends StatelessWidget {
  final Uint8List? imagemApi;
  const ImagemPerfil(this.imagemApi, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: HexColor('#1800ff'), width: 6.0),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.memory(
          imagemApi!,
          height: largura * 0.45,
          width: largura * 0.45,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
