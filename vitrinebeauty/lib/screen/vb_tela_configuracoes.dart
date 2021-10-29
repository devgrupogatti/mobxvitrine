import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:vitrinebeauty/utils/app_routes.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';

class TelaConfiguracoes extends StatefulWidget {
  // final double? alturaPadding;
  // final double? larguraPadding;
  // TelaConfiguracoes(Type double, alturaPadding, Type double, larguraPadding,
  //     {required this.alturaPadding, required this.larguraPadding});
  const TelaConfiguracoes({Key? key}) : super(key: key);

  @override
  State<TelaConfiguracoes> createState() => _TelaConfiguracoesState();
}

class _TelaConfiguracoesState extends State<TelaConfiguracoes> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraPadding = largura * 0.5;
    double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaIcone = altura * 0.1;
    double alturaPadding = altura * 0.4;
    // final routes =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, double>;
    // double? alturaPadding = routes['altura'];
    // double? larguraPadding = routes['largura'];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: alturaPadding * 0.2,
          horizontal: larguraPadding * 0.1,
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
                    'CONFIGURAÇÕES',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Column(
                children: [
                  _itemSubmenu('Gerenciar notificações', larguraIcone,
                      alturaIcone, 'shulambs', alturaPadding, larguraPadding),
                  _itemSubmenu('Alterar senha', larguraIcone, alturaIcone,
                      'shulambs', alturaPadding, larguraPadding),
                  _indiceSair('Sair', larguraIcone, alturaIcone, 'shulambs',
                      alturaPadding, larguraPadding),
                  DottedLine(
                    dashLength: 2,
                    dashColor: Colors.transparent,
                    dashGapColor: Colors.purple.shade200,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _itemSubmenu(String titulo, double larguraIcone, double alturaIcone,
      String rota, double alturaPadding, double larguraPadding) {
    return Container(
      child: Column(
        children: [
          DottedLine(
            dashLength: 2,
            dashColor: Colors.transparent,
            dashGapColor: Colors.purple.shade200,
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: alturaPadding * 0.02),
            child: Material(
              color: Colors.transparent,
              child: ListTile(
                title: Transform(
                  transform: Matrix4.translationValues(16, 0.0, 0.0),
                  child: Text(
                    titulo,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                trailing: Image.asset(
                  'assets/images/arrow.png',
                  fit: BoxFit.cover,
                ),
                //shape: ListTileTheme.shape(),
                onTap: () {
                  if (rota != 'shulambs') {
                    Navigator.of(context).pushNamed(AppRoutes.CONFIGURACOES);
                  }
                },
              ),
            ),
          ),

          // DottedLine(
          //   dashLength: 2,
          //   dashColor: Colors.transparent,
          //   dashGapColor: Colors.grey.shade500,
          // ),
        ],
      ),
    );
  }

  Container _indiceSair(String titulo, double larguraIcone, double alturaIcone,
      String rota, double alturaPadding, double larguraPadding) {
    return Container(
      child: Column(
        children: [
          DottedLine(
            dashLength: 2,
            dashColor: Colors.transparent,
            dashGapColor: Colors.purple.shade200,
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: alturaPadding * 0.02),
            child: Material(
              color: Colors.transparent,
              child: ListTile(
                title: Transform(
                  transform: Matrix4.translationValues(16, 0.0, 0.0),
                  child: Text(
                    titulo,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                trailing: Image.asset(
                  'assets/images/arrow.png',
                  fit: BoxFit.cover,
                ),
                //shape: ListTileTheme.shape(),
                onTap: () {
                  if (rota != 'shulambs') {
                    Navigator.of(context).pushNamed(AppRoutes.CONFIGURACOES);
                  }
                },
              ),
            ),
          ),

          // DottedLine(
          //   dashLength: 2,
          //   dashColor: Colors.transparent,
          //   dashGapColor: Colors.grey.shade500,
          // ),
        ],
      ),
    );
  }
}
