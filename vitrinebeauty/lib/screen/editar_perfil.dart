// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitrinebeauty/model/conta_usuario.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/widgets/widgets_central_ajuda/titulo_campo.dart';
import 'package:vitrinebeauty/widgets/widgets_editar_perfil/titulo.dart';

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({Key? key}) : super(key: key);

  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  Map<String, String> dados = {
    'nome': 'Vera',
    'cpf': '893023932-12',
    'email': 'vera@example.com',
    'celular': '(31)99716-1260'
  };

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    //double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    //double alturaIcone = altura * 0.1;
    double alturaPadding = altura * 0.4;

    ContaUsuario conta = Provider.of<ContaUsuario>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: alturaPadding * 0.1,
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
                TituloEditarPerfil(alturaPadding),
                Container(
                  child: Column(
                    children: [
                      _campoTexto(
                          altura * 0.4, largura, 'Nome', conta.nome, false),
                      _campoTexto(
                          altura * 0.4, largura, 'CPF', conta.token, true),
                      _campoTexto(
                          altura * 0.4, largura, 'E-mail', conta.email, true),
                      _campoTexto(altura * 0.4, largura, 'Celular',
                          conta.telefone, false),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: alturaPadding * 0.1),
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
                        width: double.infinity,
                        child: const Text(
                          'Alterar',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Excluir conta',
                    style: TextStyle(
                      color: HexColor('#B4ADAD'),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _campoTexto(double altura, double largura, String? nomeCampo,
      String? valor, bool editavel) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: altura * 0.02),
      child: Column(
        children: [
          TituloCampo(altura * 0.08, nomeCampo!),
          Padding(
            padding: EdgeInsets.symmetric(vertical: altura * 0.02),
            child: TextFormField(
              readOnly: editavel,
              initialValue: valor,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
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
              onSaved: (_) {},
            ),
          ),
        ],
      ),
    );
  }
}
