import 'package:flutter/cupertino.dart';

class VitrineController with ChangeNotifier {
  dynamic listProf;

  VitrineController({
    this.listProf,
  });

  void gerarLista() {
    print('nome do profissional : ${listProf["title"]}');
  }
}
