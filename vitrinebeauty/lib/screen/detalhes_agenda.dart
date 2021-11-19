// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vitrinebeauty/model/model_card_agenda.dart';
import 'package:vitrinebeauty/utils/app_routes.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/widgets/widgets_agenda/card_agenda.dart';

class DetalheAgenda extends StatefulWidget {
  final ModelCardAgenda card;

  const DetalheAgenda(this.card, {Key? key}) : super(key: key);
  // const DetalheAgenda(this.card, {Key? key}) : super(key: key);

  @override
  _DetalheAgendaState createState() => _DetalheAgendaState();
}

class _DetalheAgendaState extends State<DetalheAgenda> {
  // @override
  // void initState() {
  //   // TODO: implement initState

  //   super.initState();
  // }

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
      body: SingleChildScrollView(
        child: Padding(
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
                    child: CardAgenda(widget.card, 2),
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
                              child: Text(
                                '${widget.card.enderecoProfissional}',
                                style: const TextStyle(
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
                    padding:
                        EdgeInsets.symmetric(vertical: alturaPadding * 0.05),
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
                          child: Text(
                            '${widget.card.valorTotal}',
                            style: const TextStyle(
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
                        padding: EdgeInsets.symmetric(
                            vertical: alturaPadding * 0.03),
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
                        child: Text(
                          '${widget.card.statusAgendamento}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: alturaPadding * 0.03),
                        child: Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary: HexColor('#ffffff'),
                              primary: HexColor('#dc3545').withOpacity(0.9),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(29)),
                              ),
                            ),
                            onPressed: () {},
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: alturaPadding * 0.15,
                              child: const Text(
                                'x Cancelar agendamento',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: alturaPadding * 0.1),
                        child: Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary: HexColor('#212529'),
                              primary: HexColor('#ffffff').withOpacity(0.9),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(29)),
                                  side: BorderSide(
                                    width: 1.0,
                                    color: Colors.black87,
                                  )),
                            ),
                            onPressed: () {},
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: alturaPadding * 0.15,
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Icon(Icons.help_outline_outlined),
                                  const Text(
                                    'Ajuda',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
