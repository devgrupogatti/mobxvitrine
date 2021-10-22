import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'dart:io';

class GerenciadorImagem {
  Future<String> carregarImagemDefault() async {
    return await rootBundle.loadString('assets/images/img_perfil_default.txt');
  }

  Uint8List converterbase64ParaFile() {
    //carregarImagemDefault();
    print(carregarImagemDefault());
    var carregarImagemDefault2 = carregarImagemDefault();
    return const Base64Decoder().convert(carregarImagemDefault2.toString());
  }
}
