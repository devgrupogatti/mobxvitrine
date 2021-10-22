// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_constructors

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class CarroselImagem extends StatelessWidget {
  // const CarroselImagem({Key? key}) : super(key: key);
  List<ExactAssetImage> imagens = [
    ExactAssetImage('assets/images/Depilação-banner-APP.png'),
    ExactAssetImage('assets/images/Maquiagem-banner-APP.png'),
    ExactAssetImage('assets/images/Sobrancelha-banner-APP.png'),
    ExactAssetImage('assets/images/SPA-banner-APP.png'),
    ExactAssetImage('assets/images/Unhas-banner-APP.png'),
  ];

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    double alturaPadding = altura * 0.4;
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: alturaPadding * 0.1),
        child: SizedBox(
          height: altura * 0.5,
          width: largura * 0.95,
          child: Carousel(
            // ignore: prefer_const_literals_to_create_immutables
            dotSize: 4.0,
            dotSpacing: 15.0,
            images: [
              Image.asset(
                'assets/images/Depilação-banner-APP.png',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/Maquiagem-banner-APP.png',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/Sobrancelha-banner-APP.png',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/SPA-banner-APP.png',
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/Unhas-banner-APP.png',
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
