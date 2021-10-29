import 'package:flutter/material.dart';
import 'package:vitrinebeauty/model/model_card_agenda.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';

class CardAgenda extends StatefulWidget {
  final ModelCardAgenda card;
  const CardAgenda(this.card, {Key? key}) : super(key: key);

  @override
  _CardAgendaState createState() => _CardAgendaState();
}

class _CardAgendaState extends State<CardAgenda> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    double alturaPadding = altura * 0.4;
    double larguraPadding = largura * 0.4;
    return Container(
      child: Column(children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Card(
            color: HexColor('#260633'),
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: alturaPadding * 0.05,
                // left: larguraPadding * 0.15,
                // right: larguraPadding * 0.1,
              ),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: alturaPadding * 0.02,
                              horizontal: alturaPadding * 0.05),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${widget.card.data ?? ' '},${widget.card.hora ?? ' '}',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: alturaPadding * 0.02,
                            horizontal: alturaPadding * 0.04,
                          ),
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'N°${widget.card.id.toString()}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.purple[200],
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: alturaPadding * 0.1,
                            vertical: alturaPadding * 0.02),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.card.nomeCliente ?? '',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: alturaPadding * 0.02),
                                    child: Text(
                                      widget.card.servico!.elementAt(0),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: alturaPadding * 0.02),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '+${widget.card.servico!.length - 1} itens',
                                        style: TextStyle(
                                          color: HexColor('#fd5afb'),
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: const Text(
                                      'Ver mais',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
