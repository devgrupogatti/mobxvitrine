// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vitrinebeauty/screen/busca_categoria.dart';
import 'package:vitrinebeauty/utils/app_routes.dart';

class CardBuscaCategoria extends StatefulWidget {
  final SvgPicture imagem;
  const CardBuscaCategoria(this.imagem, {Key? key}) : super(key: key);

  @override
  _CardBuscaCategoriaState createState() => _CardBuscaCategoriaState();
}

class _CardBuscaCategoriaState extends State<CardBuscaCategoria> {
  @override
  Widget build(BuildContext context) {
    // final larguraTotal = MediaQuery.of(context).size.width * 0.7;
    // final alturaTotal = MediaQuery.of(context).size.height * 0.8;
    return Container(
      // width: larguraTotal * 0.65,
      // height: larguraTotal * 0.65,
      child: InkWell(
        onTap: () {
          //Navigator.push()
          //BuscaCategoria();
          Navigator.of(context).pushNamed(AppRoutes.BUSCACATEGORIA);
          //print('registrando click');
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: widget.imagem,
        ),
      ),
    );
  }
}
