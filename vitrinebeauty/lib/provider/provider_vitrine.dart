import 'package:flutter/cupertino.dart';

class VitrineController with ChangeNotifier {
  String? nome;
  String? idUser;
  String? token;
  VitrineController({
    this.nome,
    this.idUser,
    this.token,
  });
}
