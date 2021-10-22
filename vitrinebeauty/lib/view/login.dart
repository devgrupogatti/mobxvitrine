// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_element, prefer_final_fields, avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:vitrinebeauty/provider/autenticacao.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/utils/style_button.dart';
import 'package:vitrinebeauty/view/cadastro.dart';
import 'package:vitrinebeauty/widgets/botoes_texto.dart';

class Login extends StatefulWidget {
  //const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final Map<String, String> _authData = {'email': '', 'senha': ''};
  GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  double? latitude;
  double? longitude;
  //final _senhaController = TextEditingController();

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Column(
          children: [
            Text('Ocorreu um erro!'),
            // Text(' latitude : ${latitude}'),
            // Text('longitude : ${longitude}'),
          ],
        ),
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

  Future<void> _getCurrentUserLocation() async {
    print('entrou');
    final locData = await Location().getLocation();
    print(' latitude : ${locData.latitude}');
    print('longiude : ${locData.longitude}');
    latitude = locData.latitude;
    longitude = locData.longitude;
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
    try {
      await _getCurrentUserLocation();
      await auth.logar(_authData['email'], _authData['senha']);

      _showErrorDialog('Ocorreu um erro inesperado!');
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

  Widget _campoLogin(
    double altura,
    double largura,
    String nomeCampo,
    TextInputType tipoCampo,
    bool ehsenha,
    String hintText,
    String tipoChave,
  ) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 2),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          alignment: Alignment.centerLeft,
          child: Text(
            nomeCampo,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(
          height: altura * 0.03,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 2),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          width: largura * 0.9,
          height: altura * 0.13,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            obscureText: ehsenha ? true : false,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              overflow: TextOverflow.visible,
            ),
            keyboardType: tipoCampo,
            decoration: InputDecoration(
              border: InputBorder.none,
              // ignore: unnecessary_new
              hintStyle: new TextStyle(
                color: Colors.grey[800],
                fontStyle: FontStyle.italic,
                fontSize: 16,
              ),
              hintText: hintText,
              fillColor: Colors.white70,
            ),
            onSaved: (value) => _authData[tipoChave] = value!,
          ),
        ),
        Divider(
          height: altura * 0.05,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    ButtonStyle botaoEntrar =
        StyleButton().estiloBotao('#1800ff', '#ffffff', largura);
    //BotoesDart botao = BotoesDart();
    return Scaffold(
      backgroundColor: HexColor('#260633'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: altura * 0.07),
          child: Container(
            //color: HexColor('#260633'),
            width: double.infinity,
            child: Form(
              key: _form,
              child: Column(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/image_vb.png',
                      width: largura * 0.6,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _campoLogin(
                                altura * 0.5,
                                largura,
                                'E-mail:',
                                TextInputType.emailAddress,
                                false,
                                'Email',
                                'email'),
                            _campoLogin(
                                altura * 0.5,
                                largura,
                                'Senha:',
                                TextInputType.text,
                                true,
                                'Digite sua senha',
                                'senha'),
                          ],
                        ),
                        BotoesTexto.style(
                          'Esqueceu sua senha ?',
                          '#0dcaf0',
                          15.0,
                          EdgeInsets.only(left: largura * 0.05),
                          FontStyle.italic,
                          Alignment.centerLeft,
                          context,
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: largura * 0.08),
                          child: ElevatedButton(
                            onPressed: _submit,
                            child: Container(
                              margin:
                                  EdgeInsets.symmetric(vertical: altura * 0.02),
                              alignment: Alignment.center,
                              width: double.infinity,
                              child: Text(
                                'Entrar',
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                            style: botaoEntrar,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: altura * 0.07),
                    child: Text(
                      'Ou',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: largura * 0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Não tem acesso?',
                          style: TextStyle(
                            color: HexColor('#ffffff'),
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Cadastro(),
                              ),
                            );
                          },
                          child: Text(
                            'Cadastrar agora.',
                            style: TextStyle(
                              color: HexColor('#ffffff'),
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
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
        ),
      ),
    );
  }
}
