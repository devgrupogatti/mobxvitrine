// ignore_for_file: avoid_unnecessary_containers, avoid_web_libraries_in_flutter
import 'package:flutter/material.dart';
import 'package:vitrinebeauty/model/model_card_agenda.dart';
import 'package:vitrinebeauty/model/servico.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';

class CardAgenda extends StatefulWidget {
  final ModelCardAgenda card;
  final int tipoProcesso;
  final String nomeProfissional;
  final List<Servico> servicos;
  final String data;
  final String hora;
  const CardAgenda(this.card, this.tipoProcesso, {Key? key})
      : nomeProfissional = 'a',
        servicos = const [],
        data = '00/00/00',
        hora = '00:00';
  // CardAgenda.edit(
  //   this.nomeProfissional,
  //   this.servicos,
  //   this.data,
  //   this.hora,
  // )   : card = ModelCardAgenda(
  //         id: 01,
  //         data: '19-04-2020',
  //         hora: '18:30',
  //         nomeProfissional: 'Daniella',
  //         servico: ['Corte de cabelo', 'Corte de cabelo', 'Corte de cabelo'],
  //         valorTotal: 'R\$94,04',
  //         enderecoProfissional: 'Rua wander joaquim n° 932 - Barreiro',
  //         statusAgendamento: 'Aguardando Confirmacao',
  //       ),
  //       tipoProcesso = 1;
  @override
  _CardAgendaState createState() => _CardAgendaState();
}

class _CardAgendaState extends State<CardAgenda> {
  @override
  Widget build(BuildContext context) {
    //double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    double alturaPadding = altura * 0.4;
    //double larguraPadding = largura * 0.4;
    return Container(
      child: Column(children: [
        Card(
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
                              widget.card.nomeProfissional ?? '',
                              style: const TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Padding(
                                //   padding: EdgeInsets.symmetric(
                                //       vertical: alturaPadding * 0.02),
                                //   child: Text(
                                //     widget.card.servico!.elementAt(0),
                                //     style: const TextStyle(
                                //       fontSize: 15,
                                //       color: Colors.white,
                                //       fontWeight: FontWeight.w600,
                                //     ),
                                //   ),
                                // ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: alturaPadding * 0.02),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    // child: Text(
                                    //   '+${widget.card.servico!.length - 1} itens',
                                    //   style: TextStyle(
                                    //     color: HexColor('#fd5afb'),
                                    //     fontSize: 13,
                                    //   ),
                                    // ),
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: widget.card.servico!.length,
                                        itemBuilder: (context, index) {
                                          var servico =
                                              widget.card.servico![index];
                                          return Text(
                                            '- ${servico.nome}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                                widget.tipoProcesso == 1
                                    ? Container(
                                        alignment: Alignment.centerRight,
                                        child: const Text(
                                          'Ver mais',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13.5,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Cancelar agendamento',
                                          style: TextStyle(
                                            color: HexColor('#FEA7A7'),
                                            fontSize: 13.5,
                                            fontWeight: FontWeight.normal,
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
      ]),
    );
  }
}
