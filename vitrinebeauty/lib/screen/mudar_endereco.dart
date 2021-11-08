// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/widgets/widgets_central_ajuda/titulo_campo.dart';

class MudarEndereco extends StatefulWidget {
  const MudarEndereco({Key? key}) : super(key: key);

  @override
  State<MudarEndereco> createState() => _MudarEnderecoState();
}

class _MudarEnderecoState extends State<MudarEndereco> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    //double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    //double alturaIcone = altura * 0.1;
    double alturaPadding = altura * 0.4;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: alturaPadding * 0.2,
          horizontal: largura * 0.1,
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
              Padding(
                padding: EdgeInsets.only(top: alturaPadding * 0.1),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'NOVO ENDEREÇO',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              _campoTexto(
                  alturaPadding, largura, 'Endereço:', 'Digite o endereço...'),
              Padding(
                padding: EdgeInsets.symmetric(vertical: alturaPadding * 0.05),
                child: Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onPrimary: HexColor('#198754'),
                      primary: HexColor('#76FFDA').withOpacity(0.9),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(29)),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: const Text(
                        'Mudar Endereço',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _campoTexto(
    double altura,
    double largura,
    String? tituloCampo,
    String? campo,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: altura * 0.02),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: altura * 0.05),
              child: TituloCampo.edit(altura * 0.08, tituloCampo!, 19)),
          Padding(
            padding: EdgeInsets.symmetric(vertical: altura * 0.02),
            child: TextFormField(
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
                hintText: campo,
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
