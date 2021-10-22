import 'dart:io';

import 'package:flutter/cupertino.dart';

class ContaUsuario with ChangeNotifier {
  String? nome;
  String? idUser;
  File? imgUser;
  String? imgUserBase64;
  String? imagemDefaultBase64;
  String? token;

  ContaUsuario({
    this.token,
    this.idUser,
    this.nome,
  });

  set armazenarImgUser(File imagem) {
    imgUser = imagem;
  }

  set armazenarImgUser64(String imagem) {
    imgUserBase64 = imagem;
  }
}
