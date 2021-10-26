// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriasHome extends StatefulWidget {
  //const CategoriasHome({ Key? key }) : super(key: key);

  @override
  _CategoriasHomeState createState() => _CategoriasHomeState();
}

class _CategoriasHomeState extends State<CategoriasHome> {
  int _index = 0;
  final CarouselController _controller = CarouselController();

  List<SvgPicture> imagens = [
    SvgPicture.asset(
      'assets/images/cabeloBox.svg',
      //fit: BoxFit.contain,
      fit: BoxFit.cover,
      width: 100,
      height: 150,
    ),
    SvgPicture.asset(
      'assets/images/depilacaoBox.svg',
      //fit: BoxFit.cover,
      fit: BoxFit.cover,
      width: 100, height: 150,
    ),
    SvgPicture.asset(
      'assets/images/makeupBox.svg',
      //fit: BoxFit.cover,
      fit: BoxFit.cover,
      width: 100, height: 150,
    ),
    SvgPicture.asset(
      'assets/images/massagemBox.svg',
      // fit: BoxFit.cover,
      fit: BoxFit.cover,
      width: 100, height: 150,
    ),
    SvgPicture.asset(
      'assets/images/sobrancelhaBox.svg',
      // fit: BoxFit.cover,
      fit: BoxFit.cover,
      width: 100, height: 150,
    ),
    SvgPicture.asset(
      'assets/images/unhasBox.svg',
      //fit: BoxFit.cover,
      fit: BoxFit.cover,
      width: 100, height: 150,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double alturaPadding = altura * 0.4;
    double largura = MediaQuery.of(context).size.width;
    double larguraCategoria = largura * 0.5;

    return Stack(
      children: [
        // CategoriasHome(),
        Container(
          child: CarouselSlider.builder(
            itemCount: (imagens.length / 2).round(), //imagens.length,
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 2.0,
              enlargeCenterPage:
                  false, //distancia entre as imagens selecionadas e nao selecionadas
              //viewportFraction: 0.2, // define uma propriedade de layout
            ),
            carouselController: _controller,
            itemBuilder: (BuildContext context, int index) {
              final int first = index * 2;
              final int second = first + 1;

              return Row(
                children: [first, second].map((idx) {
                  return Expanded(
                    flex: 1,
                    /* child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: imagens[idx]),*/
                    child: IconButton(
                      onPressed: () {},
                      icon: imagens[idx],
                      iconSize: 160,
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
        Positioned(
          // usado na stack para posicionar os itens dentro
          right: largura * 0.85,
          bottom: 70,
          child: IconButton(
              onPressed: () => _controller.previousPage(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.pink,
              )),
        ),
        Positioned(
          // usado na stack para posicionar os itens dentro
          left: largura * 0.85,
          bottom: 70,
          child: IconButton(
              onPressed: () => _controller.nextPage(),
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.pink,
              )),
        ),
      ],
    ); //CarouselSlider.builder(itemCount: itemCount, itemBuilder: itemBuilder, options: options)
    /*  Container(
      child: CarouselSlider.builder(
        itemCount: (imagens.length / 2).round(), //imagens.length,
        options: CarouselOptions(
          autoPlay: false,
          aspectRatio: 2.0,
          enlargeCenterPage:
              false, //distancia entre as imagens selecionadas e nao selecionadas
          //viewportFraction: 0.2, // define uma propriedade de layout
        ),
        itemBuilder: (BuildContext context, int index) {
          final int first = index * 2;
          final int second = first + 1;

          return Row(
            children: [first, second].map((idx) {
              return Expanded(
                flex: 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: imagens[idx]),
              );
            }).toList(),
          );
        },
      ),
    );
    
     Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.pink,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.pink,
                ))
          ],
        )
    
    */
  }
}
