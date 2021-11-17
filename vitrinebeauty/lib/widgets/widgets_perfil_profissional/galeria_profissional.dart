// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vitrinebeauty/screen/tela_de_exibicao_fotos.dart';
import 'package:vitrinebeauty/widgets/widgets_busca/card_categorias_busca.dart';
import 'package:vitrinebeauty/screen/modal_fotos.dart';

class GaleriaFotos extends StatefulWidget {
  const GaleriaFotos({Key? key}) : super(key: key);

  @override
  _GaleriaFotosState createState() => _GaleriaFotosState();
}

class _GaleriaFotosState extends State<GaleriaFotos> {
  final List<String> _imagens = [
    'assets/images/Depilação-banner-APP.png',
    'assets/images/Maquiagem-banner-APP.png',
    'assets/images/Sobrancelha-banner-APP.png',
    'assets/images/SPA-banner-APP.png',
    'assets/images/Unhas-banner-APP.png',
    'assets/images/Sobrancelha-banner-APP.png',
    'assets/images/SPA-banner-APP.png',
    'assets/images/Unhas-banner-APP.png',
  ];

  @override
  Widget build(BuildContext context) {
    final larguraTotal = MediaQuery.of(context).size.width;
    final alturaTotal = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.topCenter,
      width: larguraTotal * 0.9,
      height: larguraTotal * 0.8,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 4,
        ),
        itemCount: _imagens.length,
        itemBuilder: (context, index) {
          // Item rendering
          var inicio = _imagens[index];
          return _criarFotoConainer(larguraTotal * 0.2, larguraTotal * 0.2,
              alturaTotal * 0.05, inicio, index);
        },
      ),
    );
  }

  Widget _criarFotoConainer(double largura, double altura, double tamanhoIcone,
      String? imagem, int indice) {
    return Container(
      width: largura,
      height: altura,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: largura * 0.05),
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        child: imagem != null
            ? Image.asset(
                _imagens[indice],
                height: largura,
                width: largura,
                fit: BoxFit.cover,
              )
            : Icon(
                Icons.image,
                color: Colors.white,
                size: tamanhoIcone,
              ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ModalFotos(indice);
              },
            ),
          );
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return TelaExibicao(indice);
          //     },
          //   ),
          // );
        },
      ),
    );
  }
}
