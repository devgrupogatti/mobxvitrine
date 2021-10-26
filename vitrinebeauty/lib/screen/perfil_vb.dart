// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vitrinebeauty/screen/agenda_vb.dart';
import 'package:vitrinebeauty/screen/busca_vb.dart';
import 'package:vitrinebeauty/screen/vb_inicio.dart';
import 'package:vitrinebeauty/widgets/widgets_perfil/perfil_vb_apresentacao.dart';

class PerfilVB extends StatefulWidget {
  //const PerfilVB({ Key? key }) : super(key: key);

  @override
  _PerfilVBState createState() => _PerfilVBState();
}

class _PerfilVBState extends State<PerfilVB> {
  int _selectedScreenIndex = 0;
  final List<Map<String, Widget>> _screens = [
    {'screen': VitrineInicio()},
    {'screen': BuscaVB()},
    {'screen': AgendaBeauty()},
    {'screen': PerfilVB()},
  ];

  final String menuInicio = 'assets/images/Menuinicio.svg';
  final String menuBusca = 'assets/images/menuBuscarDark.svg';
  final String menuAgenda = 'assets/images/menuAgendaDark.svg';
  final String menuPerfil = 'assets/images/menuPerfilDark.svg';

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraIcone = largura * 0.5;
    double larguraPadding = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaIcone = altura * 0.1;
    double alturaPadding = altura * 0.4;
    return Padding(
      padding: EdgeInsets.only(
        left: larguraPadding * 0.1,
        right: larguraPadding * 0.1,
        top: larguraPadding * 0.3,
        bottom: larguraPadding * 0.1,
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(alignment: Alignment.center, child: ApresentacaoPerfil()),
          Container(
            child: Text('teste'),
          )
        ],
      ),
    );
  }
}
