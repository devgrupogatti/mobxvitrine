// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vitrinebeauty/utils/app_routes.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';

class CabecalhoInicio extends StatefulWidget {
  const CabecalhoInicio({Key? key}) : super(key: key);

  @override
  _CabecalhoInicioState createState() => _CabecalhoInicioState();
}

class _CabecalhoInicioState extends State<CabecalhoInicio> {
  final duvidaIcon = 'assets/images/faqIconHome.svg';
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaIcone = altura * 0.1;
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            'Olá, Vera Doe',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.location_on,
                color: HexColor('#1800ff'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.ENDERECOCLIENTE);
                },
                child: Container(
                  width: largura * 0.5,
                  child: Text(
                    'Bravadžiluk, Sarajevo, Bósnia e Herzegovina',
                    style: TextStyle(
                      fontSize: 13.0,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Icon(Icons.notification_important_rounded),
              IconButton(
                icon: SvgPicture.asset(
                  duvidaIcon,
                  width: larguraIcone * 0.2,
                  height: alturaIcone * 0.3,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.AJUDA);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
