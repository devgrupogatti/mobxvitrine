// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vitrinebeauty/model/model_card_historico.dart';
import 'package:vitrinebeauty/utils/app_routes.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/widgets/widgets_historico/card_historico.dart';

class DetalhesHistorico extends StatefulWidget {
  final ModelCardHistorico? card;
  const DetalhesHistorico(this.card, {Key? key}) : super(key: key);

  @override
  _DetalhesHistoricoState createState() => _DetalhesHistoricoState();
}

class _DetalhesHistoricoState extends State<DetalhesHistorico> {
  final duvidaIcon = 'assets/images/faqIconHome.svg';
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraIcone = largura * 0.5;
    double larguraPadding = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaIcone = altura * 0.1;
    double alturaPadding = altura * 0.4;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: larguraPadding * 0.1,
          right: larguraPadding * 0.1,
          top: larguraPadding * 0.3,
          bottom: larguraPadding * 0.1,
        ),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Container(
                    child: Row(
                      children: [
                        const Icon(Icons.notification_important_rounded),
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
                        // InkWell(
                        //   child: SvgPicture.asset(
                        //     duvidaIcon,
                        //     width: larguraIcone * 0.2,
                        //     height: alturaIcone * 0.3,
                        //   ),
                        //   onTap: () => launch(
                        //       'https://docs.flutter.io/flutter/services/UrlLauncher-class.html'),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: alturaPadding * 0.04, top: alturaPadding * 0.2),
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  'DETALHES DO SERVIÇO',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.center,
                  // child: CardAgenda(widget.card, 2),
                  child: CardDoHistorico(widget.card),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: HexColor('#1800ff'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: alturaPadding * 0.05),
                        child: Transform(
                          transform: Matrix4.translationValues(10, 0.0, 0.0),
                          child: Container(
                            child: const Text(
                              'Bravadžiluk, Sarajevo, Bósnia e Herzegovina',
                              style: TextStyle(
                                fontSize: 13.0,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: alturaPadding * 0.05),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: alturaPadding * 0.03),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Valor total:',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'R\$50,00',
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: alturaPadding * 0.03),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Status do agendamento:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Aguardando confirmação',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
