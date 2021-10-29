// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/widgets/widgets_busca/cab_busca.dart';
import 'package:vitrinebeauty/widgets/widgets_busca/card_categorias_busca.dart';

class BuscaVB extends StatefulWidget {
  const BuscaVB({Key? key}) : super(key: key);

  @override
  State<BuscaVB> createState() => _BuscaVBState();
}

class _BuscaVBState extends State<BuscaVB> {
  List<SvgPicture> imagens = [
    SvgPicture.asset(
      'assets/images/cabeloBox.svg',
      //fit: BoxFit.contain,
      fit: BoxFit.cover,
      width: 250,
      height: 250,
    ),
    SvgPicture.asset(
      'assets/images/depilacaoBox.svg',
      //fit: BoxFit.cover,
      fit: BoxFit.cover,
      width: 150, height: 150,
    ),
    SvgPicture.asset(
      'assets/images/makeupBox.svg',
      //fit: BoxFit.cover,
      fit: BoxFit.cover,
      // width: 100, height: 100,
      width: 150, height: 150,
    ),
    SvgPicture.asset(
      'assets/images/massagemBox.svg',
      // fit: BoxFit.cover,
      fit: BoxFit.cover,
      // width: 100, height: 100,
      width: 150, height: 150,
    ),
    SvgPicture.asset(
      'assets/images/sobrancelhaBox.svg',
      // fit: BoxFit.cover,
      fit: BoxFit.cover,
      // width: 100, height: 100,
      width: 150, height: 150,
    ),
    SvgPicture.asset(
      'assets/images/unhasBox.svg',
      //fit: BoxFit.cover,
      fit: BoxFit.cover,
      // width: 100, height: 100,
      width: 150, height: 150,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    double alturaPadding = altura * 0.4;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: alturaPadding * 0.2,
        horizontal: largura * 0.04,
      ),
      child: Container(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            CabBusca(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: alturaPadding * 0.06),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'CATEGORIAS',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: HexColor('#343a40'),
                  ),
                ),
              ),
            ),
            Container(
              // alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 250,
                    childAspectRatio: (4 / 2) / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  children: imagens.map((imagem) {
                    return CardBuscaCategoria(imagem);
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
