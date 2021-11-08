// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vitrinebeauty/widgets/widgets_busca/cab_busca.dart';
import 'package:vitrinebeauty/widgets/widgets_inicio/cab_inicio.dart';

class BuscaCategoria extends StatefulWidget {
  const BuscaCategoria({Key? key}) : super(key: key);

  @override
  _BuscaCategoriaState createState() => _BuscaCategoriaState();
}

class _BuscaCategoriaState extends State<BuscaCategoria> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    double alturaPadding = altura * 0.4;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: alturaPadding * 0.1,
          horizontal: largura * 0.04,
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: alturaPadding * 0.04,
                    ),
                    child: CabecalhoInicio()),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
