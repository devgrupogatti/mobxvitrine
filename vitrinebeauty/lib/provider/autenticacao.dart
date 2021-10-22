// ignore_for_file: unnecessary_null_comparison, unused_import

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Autenticacao with ChangeNotifier {
  String? _token;
  String? _userId;
  String? confirmacaoMensagem;
  String? _nomeUsuario;
  String? _codVinculo;

  String? get nomeUsuario {
    return isAuth ? _nomeUsuario : null;
  }

  bool get isAuth {
    return token != null;
  }

  String? get codVinculo {
    return isAuth ? _codVinculo : null;
  }

  String? get userId {
    return isAuth ? _userId : null;
  }

  String? get token {
    if (_token != null) {
      return _token;
    } else {
      return null;
    }
  }

  Future<void> enviarNovaSenha(String? novaSenha) async {
    print('nova  senha : $novaSenha');
  }

  Future<void> enviarCodigo(String? codigo) async {
    print('codigo para alterar a senha : $codigo');
  }

  Future<void> enviarEmail(String? email) async {
    print('email para recuperar senha : $email');
  }

  Future<void> cadastrar(
      String? nome, String? email, String? telefone, String? senha) async {
    print(
        ' nome : $nome, email : $email, telefone : $telefone, senha : $senha');
  }

  Future<void> logar(String? email, String? senha) async {
    var uri = Uri.parse("https://vbproviders.vitrinebeauty.com/api/login");

    print('email : $email e senha : $senha');

    var resposta = await http.post(
      uri,
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
      body: json.encode({
        'email': email,
        'password': senha,
      }),
    );
    print('Status ${resposta.statusCode}');
    print(' conteudo : ${resposta.toString()}');
    final responseBody = json.decode(resposta.body);
    //print(' Erro requisicao :  $responseBody');
    print(' mensagem de resposta :  ${responseBody['message']}');

    if (responseBody['message'].toString().contains('dados invalidos')) {
      print('${responseBody['message']}');
    } else {
      print(responseBody['message']);
      _token = responseBody['sessionToken'];
      notifyListeners();
    }
    return Future.value();
  }

  Future<void> alterarSenha(String email) async {}
}
