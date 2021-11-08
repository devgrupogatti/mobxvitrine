// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_unnecessary_containers, unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:vitrinebeauty/model/model_card_historico.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';

class CardDoHistorico extends StatefulWidget {
  final ModelCardHistorico? card;
  const CardDoHistorico(this.card, {Key? key}) : super(key: key);

  @override
  _CardDoHistoricoState createState() => _CardDoHistoricoState();
}

class _CardDoHistoricoState extends State<CardDoHistorico> {
  @override
  Widget build(BuildContext context) {
    // double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    double alturaPadding = altura * 0.4;
    // double larguraPadding = largura * 0.4;
    // EstrelaAvaliacao estrela = EstrelaAvaliacao();
    // EstrelaAvaliacao().init(widget.card!.avaliacao, widget.card!.servico![0]);

    return Container(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: alturaPadding * 0.02,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SmoothStarRating(
                      allowHalfRating: false,
                      onRated: (v) {},
                      starCount: 5,
                      rating: widget.card!.avaliacao,
                      size: 30.0,
                      isReadOnly: true,
                      filledIconData: Icons.star,
                      halfFilledIconData: Icons.star_half,
                      color: Colors.orange,
                      borderColor: Colors.orange,
                      spacing: 0.0),
                ],
              ),
              Text(
                'N°${widget.card!.id.toString()}',
                style: TextStyle(
                  color: HexColor('#343a40'),
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        Card(
          color: HexColor('#3a373b'),
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: alturaPadding * 0.02,
                        horizontal: alturaPadding * 0.05),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '${widget.card!.data ?? ' '},${widget.card!.hora ?? ' '}',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
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
                              widget.card!.nomeCliente ?? '',
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: alturaPadding * 0.02),
                                  child: Text(
                                    widget.card!.servico!.elementAt(0),
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
                                      '+${widget.card!.servico!.length - 1} itens',
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
      ]),
    );
  }
}

class StarDisplayWidget extends StatelessWidget {
  final int value;
  final Widget filledStar;
  final Widget unfilledStar;
  const StarDisplayWidget({
    required Key key,
    this.value = 0,
    required this.filledStar,
    required this.unfilledStar,
  })  : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return index < value ? filledStar : unfilledStar;
      }),
    );
  }
}

class StarDisplay extends StarDisplayWidget {
  const StarDisplay({required Key key, int value = 0})
      : super(
          key: key,
          value: value,
          filledStar: const Icon(Icons.star),
          unfilledStar: const Icon(Icons.star_border),
        );
}
