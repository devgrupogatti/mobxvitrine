// ignore_for_file: unnecessary_null_comparison, unused_import

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Autenticacao with ChangeNotifier {
  String? _token;
  String? _userId;
  String? confirmacaoMensagem;
  String? _nomeUsuario;
  String? _enderecoUsuario;
  String? _telefoneUsuario;
  String? _emailUsuario;
  Uint8List? _imagemUsuario;
  String? _codVinculo;

  String? get enderecoUsuario {
    return isAuth ? _enderecoUsuario : null;
  }

  String? get nomeUsuario {
    return isAuth ? _nomeUsuario : null;
  }

  String? get telefoneUsuario {
    return isAuth ? _telefoneUsuario : null;
  }

  String? get emailUsuario {
    return isAuth ? _emailUsuario : null;
  }

  Uint8List? get imagemUsuario {
    return isAuth ? _imagemUsuario : null;
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
    var uri = Uri.parse("https://clients.vitrinebeauty.com/api/signup");
    print(
        ' nome : $nome, email : $email, telefone : $telefone, senha : $senha');

    var resposta = await http.post(
      uri,
      headers: {
        "Accept": "application/json",
        "content-type": "application/x-www-form-urlenconded"
      },
      body: json.encode({
        "name": nome,
        "email": email,
        "phone": telefone,
        "password": senha,
        "match": senha,
      }),
    );
    print('Status ${resposta.statusCode}');
    //print(' conteudo : ${resposta.toString()}');
    print('conteudo da resposta : ${resposta.body}');
    final responseBody = json.decode(resposta.body);
    //print(' Erro requisicao :  $responseBody');
    // print('conteudo da resposta : ${responseBody["session"]}');
    if (responseBody["error"]) {
      print("mensagem do erro ${responseBody["message"]}");
    } else {
      print("cadastro realizado com exito ${responseBody["message"]}");
    }
  }

  Future<void> logar(
      String? email, String? senha, String? latitude, String? longitude) async {
    var uri = Uri.parse("https://clients.vitrinebeauty.com/api/auth/signin");
    _token = null;

    print('email : $latitude e senha : $longitude');

    final resposta = await http.post(
      uri,
      headers: {
        "Accept": "application/json",
        "content-type": "application/x-www-form-urlenconded"
      },
      body: json.encode({
        "email": email,
        "password": senha,
        "lat": latitude,
        "long": longitude,
      }),
    );
    print('Status ${resposta.statusCode}');
    final responseBody = json.decode(resposta.body);

    print('resposta da requisicao : ${responseBody["session"]} ');
    print('${responseBody["session"]["token"]}');
    print(
        ' qual eh o endereco ${responseBody["userdata"]["formatted_address"]}');
    print('${responseBody["session"]["userdata"]["phone"]}');

    _nomeUsuario = responseBody["session"]["userdata"]["name"];
    _telefoneUsuario = responseBody["session"]["userdata"]["phone"];
    _emailUsuario = responseBody["session"]["userdata"]["email"];
    _imagemUsuario = const Base64Decoder()
        .convert(responseBody["session"]["userdata"]["photo"]);
    _token = responseBody["session"]["token"].toString();
    _enderecoUsuario = responseBody["session"]["userdata"]["formatted_address"];

    //print(' conteudo : ${resposta.toString()}');
    //print('conteudo da resposta : ${resposta.body}');
    // List<dynamic> data = json.decode(resposta.body);
    // final data = resposta.body[0];
    //print(' Erro requisicao :  $responseBody');
    //print('conteudo do token : ${responseBody["session"]["token"]}');
    // print('chaves da resposta ${responseBody['session']}')
    // print(' mensagem de resposta :  ${responseBody['session']}');
    // print("shulambs  data : ${data["token"]}");
    //List<dynamic> data = responseBody["session"];
    // print('shulambs');
    // print('data  data :   $data');
    // data.forEach((element) {
    //   print(' representacao $element');
    // });

    // print("shulambs 2 ");

    // data.forEach((element) {
    //   print('comeco');
    //   print('${element['address_history']}');
    //   print('${element['homeAdsList']}');
    //   //print('${element['status']}');
    //   print('dados usuario :');
    //   (element['session'] as List<dynamic>).map((campoUser) {
    //     print('${campoUser['token']}');
    //     print('${campoUser['status']}');
    //     // print('${campoUser['photo']}');
    //   }).toList();
    // });

    // if (responseBody['session'].toString().contains('dados invalidos')) {
    //   print(' informando a session ${responseBody['session']}');
    // } else {
    //   print(responseBody['session']);
    // _token = responseBody['session'];
    //   notifyListeners();
    // }
    notifyListeners();
    return Future.value();
  }

  Future<void> alterarSenha(String email) async {}

  void sair() {
    _token = null;
    notifyListeners();
  }
}
