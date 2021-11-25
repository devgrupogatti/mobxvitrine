import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitrinebeauty/controller/agenda_controller.dart';
import 'package:vitrinebeauty/model/model_card_agenda.dart';
import 'package:vitrinebeauty/screen/detalhes_agenda.dart';
import 'package:vitrinebeauty/utils/app_routes.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/widgets/widgets_agenda/card_agenda.dart';

class AgendaBeauty extends StatefulWidget {
  // const AgendaBeauty({ Key? key }) : super(key: key);

  @override
  _AgendaBeautyState createState() => _AgendaBeautyState();
}

class _AgendaBeautyState extends State<AgendaBeauty> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    double alturaPadding = altura * 0.4;
    List<ModelCardAgenda> agendas =
        Provider.of<AgendaController>(context, listen: false).agendas;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: alturaPadding * 0.2,
          horizontal: largura * 0.1,
        ),
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: alturaPadding * 0.1),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'MINHA AGENDA',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                      color: HexColor('#343a40'),
                    ),
                  ),
                ),
              ),
              Container(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: agendas.length,
                    itemBuilder: (ctx, index) {
                      final card = agendas[index];
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetalheAgenda(card);
                                },
                              ),
                            );
                          },
                          child: CardAgenda(card, 1));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
