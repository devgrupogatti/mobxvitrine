import 'package:flutter/material.dart';
import 'package:vitrinebeauty/controller/historico_controller.dart';
import 'package:vitrinebeauty/model/model_card_historico.dart';
import 'package:vitrinebeauty/widgets/widgets_historico/card_historico.dart';

class Historico extends StatefulWidget {
  const Historico({Key? key}) : super(key: key);

  @override
  _HistoricoState createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    List<ModelCardHistorico> lista = HistoricoController().listCatdHistorico;
    double alturaPadding = altura * 0.4;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: alturaPadding * 0.2,
            horizontal: largura * 0.1,
          ),
          child: Container(
            child: Column(
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: alturaPadding * 0.1),
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'HISTÓRICO',
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: lista.length,
                      itemBuilder: (ctx, index) {
                        final card = lista[index];
                        return CardDoHistorico(card);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
