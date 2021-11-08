import 'package:flutter/material.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/widgets/widgets_central_ajuda/titulo_campo.dart';

class AlterarSenha extends StatefulWidget {
  const AlterarSenha({Key? key}) : super(key: key);

  @override
  _AlterarSenhaState createState() => _AlterarSenhaState();
}

class _AlterarSenhaState extends State<AlterarSenha> {
  Widget _alteracaoSenha(
    double altura,
    double largura,
    String? nomeCampo,
    TextInputType tipoCampo,
    bool ehsenha,
    String tipoChave,
  ) {
    return Padding(
      padding: EdgeInsets.only(
          top: altura, left: largura, right: largura, bottom: altura * 0.2),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: altura * 0.2, horizontal: largura * 0.6),
            child: TituloCampo(altura * 0.08, nomeCampo!),
          ),
          TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                filled: true,
                hintStyle: TextStyle(
                    color: Colors.grey[800], fontStyle: FontStyle.italic),
                hintText: nomeCampo,
                fillColor: Colors.white70,
              ),
              validator: (value) {
                // if (tipoChave == 'confirmarSenha' &&
                //     _authData[cont].toString() != '') {
                //   if (value == _textController.text) {
                //     return null;
                //   } else {
                //     return 'As senhas não coincidem';
                //   }
                // }
              },
              onSaved: (value) => {
                    // _authData[cont][tipoChave] = value!,
                    // print(
                    //     'testando aqui authdata: ${_authData[cont][tipoChave]}'),
                    // print('testando aqui : ${_textController.text}'),
                  }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraPadding = largura * 0.5;
    //double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    //double alturaIcone = altura * 0.1;
    double alturaPadding = altura * 0.4;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: HexColor('#260633'),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: alturaPadding * 0.1,
                    left: largura * 0.1,
                    right: largura * 0.1,
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 7.0,
                        shape: const CircleBorder(),
                        minimumSize: const Size(40, 40),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.pink[300],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: alturaPadding * 0.1,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          // margin: EdgeInsets.symmetric(vertical: altura * 0.1),
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/images/image_vb.png',
                            width: largura * 0.45,
                            height: altura * 0.2,
                          ),
                        ),
                        Transform(
                          transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: const Text(
                              'ALTERAR SENHA',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: Container(
              color: Colors.white,
              width: largura,
              height: altura * 0.6,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: larguraPadding * 0.2,
                        vertical: alturaPadding * 0.04),
                    child: Text(
                      'Preencha o formulario abaixo para cadastrar uma nova senha  de acesso:',
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        _alteracaoSenha(
                            alturaPadding * 0.1,
                            larguraPadding * 0.2,
                            'Senha',
                            TextInputType.text,
                            false,
                            'senha'),
                        _alteracaoSenha(
                            alturaPadding * 0.1,
                            larguraPadding * 0.2,
                            'Confirmar Senha',
                            TextInputType.text,
                            false,
                            'senha'),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: alturaPadding * 0.1),
                    child: Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: HexColor('#ffffff'),
                          primary: HexColor('#1818ff').withOpacity(0.9),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(29)),
                          ),
                        ),
                        onPressed: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: largura * 0.7,
                          child: const Text(
                            'Confirmar',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottom: 0.0,
          ),
        ],
      ),
    );
  }
}
