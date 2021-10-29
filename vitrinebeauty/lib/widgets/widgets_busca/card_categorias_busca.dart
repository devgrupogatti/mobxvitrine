import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardBuscaCategoria extends StatefulWidget {
  final SvgPicture imagem;
  const CardBuscaCategoria(this.imagem, {Key? key}) : super(key: key);

  @override
  _CardBuscaCategoriaState createState() => _CardBuscaCategoriaState();
}

class _CardBuscaCategoriaState extends State<CardBuscaCategoria> {
  @override
  Widget build(BuildContext context) {
    final larguraTotal = MediaQuery.of(context).size.width * 0.7;
    final alturaTotal = MediaQuery.of(context).size.height * 0.8;
    return Container(
      // width: larguraTotal * 0.65,
      // height: larguraTotal * 0.65,
      child: InkWell(
        onTap: () {},
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
