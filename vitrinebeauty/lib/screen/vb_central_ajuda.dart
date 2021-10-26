// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vitrinebeauty/utils/adaptative_text_size.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/widgets/widgets_central_ajuda/mensagem_tela.dart';
import 'package:vitrinebeauty/widgets/widgets_central_ajuda/titulo.dart';
import 'package:vitrinebeauty/widgets/widgets_central_ajuda/titulo_campo.dart';

class CentralAjuda extends StatefulWidget {
  //const CentralAjuda({Key? key}) : super(key: key);

  @override
  _CentralAjudaState createState() => _CentralAjudaState();
}

class _CentralAjudaState extends State<CentralAjuda> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaIcone = altura * 0.1;
    double alturaPadding = altura * 0.4;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: alturaPadding * 0.2,
            left: largura * 0.1,
            right: largura * 0.1,
          ),
          child: Container(
            child: Column(
              children: [
                Container(
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
                Titulo(alturaPadding),
                MensagemTela(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: alturaPadding * 0.1),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Conta pra gente:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _campoTexto(altura * 0.4, largura, 'Nome'),
                      _campoEmail(
                        altura * 0.4,
                        largura,
                        'E-mail',
                      ),
                      _campoTexto(altura * 0.4, largura, 'Assunto'),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: altura * 0.02),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                            border: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                                color: Colors.grey[800],
                                fontStyle: FontStyle.italic),
                            hintText: 'Digite a sua mensagem',
                            fillColor: Colors.white70,
                          ),
                          controller: myController,
                          maxLength: 1000,
                          maxLines: 12,
                          onSaved: (_) {},
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: HexColor('#525050'),
                          primary: HexColor('#76FFDA').withOpacity(0.9),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(29)),
                          ),
                        ),
                        onPressed: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Text(
                            'Enviar',
                            style: TextStyle(fontWeight: FontWeight.w600),
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
    );
  }

  Widget _campoTexto(
    double altura,
    double largura,
    String? nomeCampo,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: altura * 0.02),
      child: Column(
        children: [
          TituloCampo(altura * 0.08, nomeCampo!),
          Padding(
            padding: EdgeInsets.symmetric(vertical: altura * 0.02),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                filled: true,
                hintStyle: TextStyle(
                    color: Colors.grey[800], fontStyle: FontStyle.italic),
                hintText: nomeCampo,
                fillColor: Colors.white70,
              ),
              onSaved: (_) {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _campoEmail(
    double altura,
    double largura,
    String? nomeCampo,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: altura * 0.02),
      child: Column(
        children: [
          TituloCampo(altura * 0.08, nomeCampo!),
          Padding(
            padding: EdgeInsets.symmetric(vertical: altura * 0.02),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                filled: true,
                hintStyle: TextStyle(
                    color: Colors.grey[800], fontStyle: FontStyle.italic),
                hintText: nomeCampo,
                fillColor: Colors.white70,
              ),
              onSaved: (_) {},
            ),
          ),
        ],
      ),
    );
  }
}
