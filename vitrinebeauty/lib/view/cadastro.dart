// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_new, unrelated_type_equality_checks, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:vitrinebeauty/provider/autenticacao.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/utils/style_button.dart';

class Cadastro extends StatefulWidget {
  // const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  late final ScrollController _controller;
  late bool _fabIsVisible = true;
  GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  final _senhaController = TextEditingController();
  final Map<String, String> _authData = {
    'nome': '',
    'email': '',
    'telefone': '',
    'senha': '',
    'confirmarSenha': '',
  };

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        _fabIsVisible =
            _controller.position.userScrollDirection == ScrollDirection.forward;
      });
    });
  }

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Ocorreu um erro!'),
        content: Text(msg),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Fechar'),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    Autenticacao auth = Provider.of<Autenticacao>(context, listen: false);
    if (!_form.currentState!.validate()) {
      return;
    }
    _form.currentState!.save();
    String? email = _authData['email'];
    String? senha = _authData['senha'];
    print('rastreando email : $email , rastreando senha : $senha');
    setState(() {
      _isLoading = true;
    });
    try {
      await auth.cadastrar(_authData['nome'], _authData['email'],
          _authData['telefone'], _authData['senha']);
      _showConfirmDialog();
      // _showErrorDialog('Ocorreu um erro inesperado!');
    } catch (error) {
      _showErrorDialog('Ocorreu um erro inesperado!');
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Cadastro realizado!'),
        content: Text('Será retornado para a tela de login'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              // Auth auth = Provider.of(context, listen: false);
              //auth.logout();
              // Navigator.of(context).popAndPushNamed(AppRoutes.AUTHOUFICHAS);
            },
            child: Text('Fechar'),
          ),
        ],
      ),
    );
  }

  // InputDecoration _estiloDoCampo(String hintText) {
  //   return InputDecoration(
  //     border: InputBorder.none,
  //     hintStyle: new TextStyle(
  //       color: Colors.grey[800],
  //       fontStyle: FontStyle.italic,
  //       fontSize: 16,
  //     ),
  //     hintText: hintText,
  //     fillColor: Colors.white70,
  //   );
  // }

  // Widget _campoLogin(
  //   double altura,
  //   double largura,
  //   String nomeCampo,
  //   TextInputType tipoCampo,
  //   bool ehsenha,
  //   String hintText,
  //   String tipoChave,
  // ) {
  //   print('entrrou na funcao');
  //   return Column(
  //     children: [
  //       Container(
  //         margin: EdgeInsets.symmetric(vertical: 2),
  //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
  //         alignment: Alignment.centerLeft,
  //         child: Text(
  //           nomeCampo,
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 20,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //       Divider(
  //         height: altura * 0.03,
  //       ),
  //       Container(
  //         margin: EdgeInsets.symmetric(vertical: 2),
  //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
  //         width: largura * 0.9,
  //         height: altura * 0.13,
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(30),
  //         ),
  //         child: tipoChave.contains('senha')
  //             ? TextFormField(
  //                 obscureText: true,
  //                 style: TextStyle(
  //                   color: Colors.black87,
  //                   fontSize: 22,
  //                 ),
  //                 keyboardType: tipoCampo,
  //                 decoration: _estiloDoCampo(hintText),
  //                 controller: _senhaController,
  //                 onSaved: (value) => _authData[tipoChave] = value!,
  //               )
  //             : tipoChave.contains('confirmarSenha')
  //                 ? TextFormField(
  //                     obscureText: true,
  //                     style: TextStyle(
  //                       color: Colors.black87,
  //                       fontSize: 22,
  //                     ),
  //                     keyboardType: tipoCampo,
  //                     decoration: _estiloDoCampo(hintText),
  //                     validator: (value) {
  //                       if (value != _senhaController.text) {
  //                         // ignore: avoid_print

  //                         return 'Senhas diferentes';
  //                       }
  //                       return null;
  //                     },
  //                     onSaved: (value) => _authData[tipoChave] = value!,
  //                   )
  //                 : TextFormField(
  //                     style: TextStyle(
  //                       color: Colors.black87,
  //                       fontSize: 22,
  //                     ),
  //                     keyboardType: tipoCampo,
  //                     decoration: _estiloDoCampo(hintText),
  //                     onSaved: (value) {
  //                       print('entrrou na value $value');
  //                       _authData[tipoChave] = value!;
  //                       print(
  //                           ' nome da chave $tipoChave e do seu valor ${_authData[tipoChave]}');
  //                     }),
  //       ),
  //       Divider(
  //         height: altura * 0.05,
  //       ),
  //     ],
  //   );
  // }

  Widget _campoTexto(
      double altura,
      double largura,
      String? nomeCampo,
      TextInputType tipoCampo,
      bool ehSenha,
      String nomeLabel,
      String nomeChave) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: altura * 0.02, horizontal: largura * 0.05),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Container(
              margin:
                  EdgeInsets.only(bottom: altura * 0.02, left: altura * 0.05),
              child: Text(
                nomeCampo!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: altura * 0.02),
            child: TextFormField(
              obscureText: ehSenha ? true : false,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                filled: true,
                hintStyle: TextStyle(
                    fontSize: 19,
                    color: Colors.grey[800],
                    fontStyle: FontStyle.italic),
                hintText: nomeLabel,
                fillColor: Colors.white,
              ),
              onSaved: (value) => _authData[nomeChave] = value!,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    ButtonStyle botaoCadastrar =
        StyleButton().estiloBotao('#1800ff', '#ffffff', largura);
    return Scaffold(
      backgroundColor: HexColor('#260633'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          controller: _controller,
          child: Padding(
            padding: EdgeInsets.only(top: altura * 0.2),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Cadastro',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _campoTexto(altura * 0.5, largura, 'Nome:',
                          TextInputType.text, false, 'Nome', 'nome'),
                      _campoTexto(altura * 0.5, largura, 'E-mail:',
                          TextInputType.emailAddress, false, 'Email', 'email'),
                      _campoTexto(altura * 0.5, largura, 'Telefone:',
                          TextInputType.number, false, 'Telefone', 'telefone'),
                      _campoTexto(
                          altura * 0.5,
                          largura,
                          'Senha:',
                          TextInputType.text,
                          true,
                          'Digite sua senha',
                          'senha'),
                      _campoTexto(
                          altura * 0.5,
                          largura,
                          'Confirmar senha:',
                          TextInputType.text,
                          true,
                          'Confirme sua senha',
                          'confirmarSenha'),
                    ],
                  ),
                  Divider(
                    color: HexColor('#260633'),
                    height: altura * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: largura * 0.03),
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submit,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: altura * 0.02),
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Text(
                            'Cadastrar',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        style: botaoCadastrar,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                backgroundColor: HexColor('#ffffff'),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: HexColor('#ff1493'),
                ),
              ),
            ),
            Text(
              'voltar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
        duration: Duration(milliseconds: 100),
        opacity: _fabIsVisible ? 1 : 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
