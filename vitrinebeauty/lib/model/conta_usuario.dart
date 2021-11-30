import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

class ContaUsuario with ChangeNotifier {
  String? nome;
  String? idUser;
  // File? imgUser;
  // String? imgUserBase64;
  // String? imagemDefaultBase64;
  String? token;
  String? telefone;
  String? email;
  //List<Uint8List> imagens1 = [];
  Uint8List? imagemPerfil;

  ContaUsuario({
    this.token,
    this.idUser,
    this.nome,
    this.telefone,
    this.email,
    this.imagemPerfil,
  });
}
