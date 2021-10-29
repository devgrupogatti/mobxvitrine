// ignore_for_file: deprecated_member_use, prefer_const_constructors, unused_field, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_unnecessary_containers

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vitrinebeauty/view/agenda_vb.dart';
import 'package:vitrinebeauty/screen/busca_vb.dart';
import 'package:vitrinebeauty/screen/editar_perfil.dart';
import 'package:vitrinebeauty/screen/perfil_vb.dart';
import 'package:vitrinebeauty/screen/vb_inicio.dart';
import 'package:vitrinebeauty/screen/vb_tela_configuracoes.dart';
import 'package:vitrinebeauty/utils/app_routes.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/widgets/widgets_perfil/perfil_vb_apresentacao.dart';

class VBTabScreren extends StatefulWidget {
  //const VBTabScreren({ Key? key }) : super(key: key);

  @override
  State<VBTabScreren> createState() => _VBTabScrerenState();
}

class _VBTabScrerenState extends State<VBTabScreren> {
  int _selectedScreenIndex = 0;
  int _selectedScreenPreviousIndex = 0;
  late final ScrollController _controller;
  late bool _fabIsVisible = true;
  final bool _isfirstLog = true;

  final List<Map<String, Widget>> _screens = [
    {'screen': VitrineInicio()},
    {'screen': BuscaVB()},
    {'screen': AgendaBeauty()},
    {'screen': PerfilVB()},
    {'screen': EditarPerfil()}
  ];

  final String menuInicio = 'assets/images/Menuinicio.svg';
  final String menuBusca = 'assets/images/Menubuscar.svg';
  final String menuAgenda = 'assets/images/Menuagenda.svg';
  final String menuPerfil = 'assets/images/Menuperfil.svg';
  final String menuInicioDark = 'assets/images/Menuinicio.svg';
  final String menuBuscaDark = 'assets/images/menuBuscarDark.svg';
  final String menuAgendaDark = 'assets/images/menuAgendaDark.svg';
  final String menuPerfilDark = 'assets/images/menuPerfilDark.svg';

  final String sairIconPerfil = 'assets/images/sairIcon.svg';
  final String configuracoesPerfil = 'assets/images/configuracoes.svg';
  final String ajudaPerfil = 'assets/images/ajuda.svg';
  final String pesquisaPerfil = 'assets/images/search.svg';
  final String agendaPerfil = 'assets/images/agenda.svg';
  final String sinoPerfil = 'assets/images/sino.svg';
  final String userPerfil = 'assets/images/user.svg';
  final String arrow = 'assets/images/arrow.png';

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        _fabIsVisible =
            _controller.position.userScrollDirection == ScrollDirection.forward;
      });
    });
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenPreviousIndex = _selectedScreenIndex;
      _selectedScreenIndex = index;
    });
  }

  _backScreen() {
    setState(() {
      _selectedScreenIndex = _selectedScreenPreviousIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraPadding = largura * 0.5;
    double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaIcone = altura * 0.1;
    double alturaPadding = altura * 0.4;

    //final layout = LayoutController();
    //child: _screens[layout.posicaoLayoutAtual]['screen'],
    // child: _screens[_selectedScreenIndex]['screen'],
    // child: _selectedScreenIndex < 1
    //     ? _screens[_selectedScreenIndex]['screen']
    //     : _screens[layout.posicaoLayoutAtual]),
    return Scaffold(
      backgroundColor:
          _selectedScreenIndex < 3 ? Colors.white : HexColor('#260633'),
      body: SingleChildScrollView(
          controller: _controller,
          child: _selectedScreenIndex < 3
              ? _screens[_selectedScreenIndex]['screen']
              : Padding(
                  padding: EdgeInsets.only(
                    left: larguraPadding * 0.1,
                    right: larguraPadding * 0.1,
                    top: larguraPadding * 0.6,
                    bottom: larguraPadding * 0.1,
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: ApresentacaoPerfil(),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(top: alturaPadding * 0.2),
                          child: Column(
                            children: [
                              //Border(),
                              // DottedLine(
                              //   dashLength: 3,
                              //   dashColor: Colors.transparent,
                              //   dashGapColor: Colors.grey.shade500,
                              // ),
                              _itemMenu(userPerfil, 'Editar perfil',
                                  larguraIcone, alturaIcone, 3),
                              _itemMenu(sinoPerfil, 'Notificações',
                                  larguraIcone, alturaIcone, 1),
                              _itemMenu(agendaPerfil, 'Agenda', larguraIcone,
                                  alturaIcone, 2),
                              _itemMenu(pesquisaPerfil, 'Histórico',
                                  larguraIcone, alturaIcone, 4),

                              DottedLine(
                                dashLength: 2,
                                dashColor: Colors.transparent,
                                dashGapColor: Colors.grey.shade500,
                              ),
                              Divider(
                                height: alturaPadding * 0.3,
                              ),

                              _itemSubmenu(
                                  ajudaPerfil,
                                  'Ajuda',
                                  larguraIcone,
                                  alturaIcone,
                                  AppRoutes.AJUDA,
                                  alturaPadding,
                                  larguraPadding),
                              _itemSubmenu(
                                  configuracoesPerfil,
                                  'Configurações',
                                  larguraIcone,
                                  alturaIcone,
                                  AppRoutes.CONFIGURACOES,
                                  alturaPadding,
                                  larguraPadding),
                              _itemSubmenu(
                                  sairIconPerfil,
                                  'Sair',
                                  larguraIcone,
                                  alturaIcone,
                                  'shulambs',
                                  alturaPadding,
                                  larguraPadding),

                              DottedLine(
                                dashLength: 2,
                                dashColor: Colors.transparent,
                                dashGapColor: Colors.grey.shade700,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
          // VitrineInicio(),
          ),
      //floatingActionButton: ,
      floatingActionButton: _selectedScreenIndex == 3
          ? AnimatedOpacity(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    child: FloatingActionButton(
                      onPressed: () {
                        // Navigator.of(context).pop();
                        _backScreen();
                      },
                      backgroundColor: HexColor('#ffffff'),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: HexColor('#ff1493'),
                      ),
                    ),
                  ),
                  Text(
                    'voltar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              duration: Duration(milliseconds: 100),
              opacity: _fabIsVisible ? 1 : 0,
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: _selectedScreenIndex < 3 ? Colors.black : Colors.white,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 10.0,
          iconSize: 30,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          //fixedColor: Colors.white,
          //backgroundColor: Colors.white,
          //selectedItemColor: Colors.white,
          onTap: _selectScreen,
          unselectedItemColor: Colors.white, // cor dos icone nao selecionados
          selectedItemColor:
              Theme.of(context).accentColor, // cor do icone selecionado
          currentIndex:
              _selectedScreenIndex, // informa qual icone foi selecionado
          type:
              BottomNavigationBarType.shifting, // animacao da escolha de indice

          items: [
            _botaoInferior(
                menuInicio, menuInicioDark, larguraIcone, alturaIcone),
            _botaoInferior(menuBusca, menuBuscaDark, larguraIcone, alturaIcone),
            _botaoInferior(
                menuAgenda, menuAgendaDark, larguraIcone, alturaIcone),
            _botaoInferior(
                menuPerfil, menuPerfilDark, larguraIcone, alturaIcone),
          ],
        ),
      ),
    );
  }

  Container _itemMenu(
    String icone,
    String titulo,
    double larguraIcone,
    double alturaIcone,
    int indice,
  ) {
    return Container(
      child: Column(
        children: [
          DottedLine(
            dashLength: 2,
            dashColor: Colors.transparent,
            dashGapColor: Colors.grey.shade500,
          ),
          Divider(
            height: alturaIcone * 0.2,
          ),
          Material(
            color: HexColor('#260633'),
            child: ListTile(
              leading: SvgPicture.asset(icone),
              title: Transform(
                transform: Matrix4.translationValues(-16, 0.0, 0.0),
                child: Text(
                  titulo,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ),
              trailing: Image.asset(
                'assets/images/arrow.png',
                fit: BoxFit.cover,
              ),
              //shape: ListTileTheme.shape(),
              onTap: indice != 0
                  ? () {
                      setState(() {
                        switch (indice) {
                          case 1:
                            _selectedScreenPreviousIndex = _selectedScreenIndex;
                            _selectedScreenIndex = indice;
                            break;
                          case 2:
                            _selectedScreenPreviousIndex = _selectedScreenIndex;
                            _selectedScreenIndex = indice;
                            break;
                          case 3:
                            Navigator.of(context)
                                .pushNamed(AppRoutes.EDITARPERFIL);
                            break;

                          case 4:
                            Navigator.of(context)
                                .pushNamed(AppRoutes.HISTORICO);
                            break;
                          default:
                            Navigator.of(context)
                                .pushNamed(AppRoutes.EDITARPERFIL);
                            break;
                        }
                      });
                    }
                  : () {},
            ),
          ),
          Divider(
            height: alturaIcone * 0.2,
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

  Container _itemSubmenu(
      String icone,
      String titulo,
      double larguraIcone,
      double alturaIcone,
      String rota,
      double alturaPadding,
      double larguraPadding) {
    return Container(
      child: Column(
        children: [
          DottedLine(
            dashLength: 2,
            dashColor: Colors.transparent,
            dashGapColor: Colors.grey.shade700,
          ),
          Divider(
            height: alturaIcone * 0.2,
          ),
          Material(
            color: HexColor('#260633'),
            child: ListTile(
              leading: SvgPicture.asset(icone),
              title: Transform(
                transform: Matrix4.translationValues(-16, 0.0, 0.0),
                child: Text(
                  titulo,
                  style: TextStyle(
                      color: Colors.grey.shade700,
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
                Navigator.of(context).pushNamed(rota);
              },
            ),
          ),
          Divider(
            height: alturaIcone * 0.2,
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

  BottomNavigationBarItem _botaoInferior(String urlImagem, String urlImagemDark,
      double larguraIcone, double alturaIcone) {
    return BottomNavigationBarItem(
      backgroundColor:
          _selectedScreenIndex < 3 ? Colors.white : HexColor('#260633'),
      icon: SvgPicture.asset(
        _selectedScreenIndex < 3 ? urlImagem : urlImagemDark,
        width: larguraIcone * 0.4,
        height: alturaIcone * 0.6,
      ),
      // title: Divider(),
      label: 'campo',
    );
  }
}

/*
SizedBox(
  height: 150.0,
  width: 300.0,
  child: Carousel(
    images: [
      NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
      NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
      ExactAssetImage("assets/images/LaunchImage.jpg")
    ],
  )
*/
