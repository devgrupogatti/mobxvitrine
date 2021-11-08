// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_new, unnecessary_const, avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitrinebeauty/provider/autenticacao.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/utils/style_button.dart';

class RecuperarSenha extends StatefulWidget {
  //const RecuperarSenha({Key? key}) : super(key: key);

  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  var cont = 0;
  GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  String? tituloCampo;
  String? nomeCampo;
  String? chaveAtual;
  String chaveConfirmacao = 'confirmarSenha';
  String? senhaAntiga;
  var _senhaController = TextEditingController();
  final _textController = TextEditingController();
  final List<Map<String, String>> _authData = [
    {
      'email': '',
      'titulo': 'E-mail de cadastro : ',
      'nomeCampo': 'Email',
    },
    {
      'codigo': '',
      'titulo': 'Insira o código enviado :',
      'nomeCampo': 'Código',
    },
    {
      'senha': '',
      'titulo': 'Insira a nova senha :',
      'nomeCampo': 'Senha',
    },
    {
      'confirmarSenha': '',
      'titulo': 'Confirme a senha : ',
      'nomeCampo': '',
    }
  ];

  @override
  void initState() {
    // TODO: implement initState

    // tituloCampo = _authData[cont]['titulo'];
    // nomeCampo = _authData[cont]['nomeCampo'];
    chaveAtual = 'email';
    print(' Contador : $cont');
    super.initState();
  }

  // void _showErrorDialog(String msg) {
  //   showDialog(
  //     context: context,
  //     builder: (ctx) => AlertDialog(
  //       title: Text('Ocorreu um erro!'),
  //       content: Text(msg),
  //       actions: <Widget>[
  //         ElevatedButton(
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //           child: Text('Fechar'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  void _showConfirmDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Senha alterada com sucesso!'),
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
            child: Text('Retornar'),
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

    setState(() {
      _isLoading = true;
    });
    print('chave atual : ${cont}'); //e dados ${_authData[cont][]}')
    //await  auth.enviarEmail(_authData[0]['email']);_authData[cont]
    switch (cont) {
      case 0:
        await auth.enviarEmail(_authData[0]['email']);
        chaveAtual = 'codigo';
        break;
      case 1:
        await auth.enviarCodigo(_authData[1]['codigo']);
        chaveAtual = 'senha';
        break;
      case 2:
        await auth.enviarNovaSenha(_authData[2]['confirmarSenha']);
        _showConfirmDialog('Alteração de senha concluída');
        break;

      default:
    }

    setState(() {
      if (cont < 2) cont++;
      _textController.text = '';
      _isLoading = false;
      if (cont < 3) {
        return;
      } else {
        _showConfirmDialog('Alteração de senha concluída');
      }
    });
  }

  Widget _tituloCampo(String? campo, double altura) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: altura * 0.02),
        child: Text(
          campo!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
    );
  }

  Widget _campoEmail(
    double altura,
    double largura,
    String? nomeCampo,
    TextInputType tipoCampo,
    bool ehsenha,
    String tipoChave,
  ) {
    return Column(
      children: [
        TextFormField(
            controller: _textController,
            obscureText: ehsenha,
            decoration: new InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
              filled: true,
              hintStyle: new TextStyle(
                  color: Colors.grey[800], fontStyle: FontStyle.italic),
              hintText: nomeCampo,
              fillColor: Colors.white70,
            ),
            onSaved: (value) => {
                  _authData[cont][tipoChave] = value!,
                  print('testando aqui : ${_textController.text}'),
                }),
      ],
    );
  }

  Widget _alteracaoSenha(
    double altura,
    double largura,
    String? nomeCampo,
    TextInputType tipoCampo,
    bool ehsenha,
    String tipoChave,
  ) {
    return Column(
      children: [
        TextFormField(
            obscureText: true,
            decoration: new InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
              filled: true,
              hintStyle: new TextStyle(
                  color: Colors.grey[800], fontStyle: FontStyle.italic),
              hintText: nomeCampo,
              fillColor: Colors.white70,
            ),
            validator: (value) {
              if (tipoChave == 'confirmarSenha' &&
                  _authData[cont].toString() != '') {
                if (value == _textController.text) {
                  return null;
                } else {
                  return 'As senhas não coincidem';
                }
              }
            },
            onSaved: (value) => {
                  _authData[cont][tipoChave] = value!,
                  print(
                      'testando aqui authdata: ${_authData[cont][tipoChave]}'),
                  print('testando aqui : ${_textController.text}'),
                }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    ButtonStyle botaoEnviar =
        StyleButton().estiloBotao('#6610f2', '#ffffff', largura);
    return Scaffold(
      backgroundColor: HexColor('#260633'),
      //backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    // margin: EdgeInsets.symmetric(vertical: altura * 0.1),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/image_vb.png',
                      width: largura * 0.5,
                      height: altura * 0.3,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.symmetric(vertical: altura * 0.03),
                    child: Text(
                      'RECUPERAR SENHA',
                      style: TextStyle(
                        color: HexColor('#ffffff'),
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                height: altura * 0.8,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: altura * 0.03),
                      alignment: Alignment.center,
                      child: Text(
                        'Preencha o formulário abaixo com seu e e-mail de cadastro',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: largura * 0.06,
                        top: altura * 0.02,
                        right: largura * 0.06,
                      ),
                      child: Form(
                        key: _form,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _tituloCampo(
                                _authData[cont]['titulo'], altura * 0.02),
                            Divider(
                              height: 10,
                            ),
                            chaveAtual == 'senha'
                                ? Column(
                                    children: [
                                      _campoEmail(
                                          altura * 0.4,
                                          largura,
                                          _authData[cont]['nomeCampo'],
                                          TextInputType.text,
                                          true,
                                          'senha'),
                                      Divider(
                                        height: 10,
                                      ),
                                      _alteracaoSenha(
                                          altura * 0.4,
                                          largura,
                                          _authData[cont + 1]['nomeCampo'],
                                          TextInputType.text,
                                          false,
                                          'confirmarSenha'),
                                    ],
                                  )
                                : _campoEmail(
                                    altura * 0.4,
                                    largura,
                                    _authData[cont]['nomeCampo'],
                                    TextInputType.emailAddress,
                                    false,
                                    chaveAtual!),
                            Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: altura * 0.02),
                              constraints: BoxConstraints.tightFor(
                                  width: largura * 0.9, height: altura * 0.07),
                              child: ElevatedButton(
                                onPressed: _submit,
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: altura * 0.02),
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  child: Text(
                                    'Enviar',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                style: botaoEnviar,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
