// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:vitrinebeauty/model/lista_profissionais.dart';
import 'package:vitrinebeauty/model/profissionais_pesquisados.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/widgets/widgets_inicio/cab_inicio.dart';
import 'package:vitrinebeauty/widgets/widgets_inicio/carrosel_imagem.dart';
import 'package:vitrinebeauty/widgets/widgets_inicio/inicio_page_categorias.dart';
import 'package:vitrinebeauty/widgets/pesquisa.dart';

class VitrineInicio extends StatefulWidget {
  //const VitrineInicio({ Key? key }) : super(key: key);

  @override
  _VitrineInicioState createState() => _VitrineInicioState();
}

class _VitrineInicioState extends State<VitrineInicio> {
  int _selectedScreenIndex = 0;

  final String menuInicio = 'assets/images/Menuinicio.svg';
  final String menuBusca = 'assets/images/Menubuscar.svg';
  final String menuAgenda = 'assets/images/Menuagenda.svg';
  final String menuPerfil = 'assets/images/Menuperfil.svg';

//  List<Map<String, String>> profissionais = Profissionais().profissionais;

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaIcone = altura * 0.1;
    double alturaPadding = altura * 0.4;
    List<Map<String, String>> profissionais = Profissionais().profissionais;
    return Column(
      children: [
        Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          //mainAxisSize: MainAxisSize.values,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: alturaPadding * 0.2,
                left: largura * 0.1,
                right: largura * 0.1,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CabecalhoInicio(),
                  PesquisaProfissional(),
                ],
              ),
            ),
            CarroselImagem(),
          ],
        ),
        //CarroselImagem(),
        Padding(
          padding: EdgeInsets.only(
              top: alturaPadding * 0.2,
              left: largura * 0.02,
              right: largura * 0.02),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Categorias',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CategoriasHome(),
              Padding(
                padding: EdgeInsets.only(
                  top: alturaPadding * 0.1,
                  left: largura * 0.01,
                  right: largura * 0.2,
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: alturaIcone * 0.1),
                        child: Text(
                          'Profissionais disponíveis',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: alturaIcone * 0.1),
                        child: Text(
                          'Recomendados',
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: profissionais.length,
                          itemBuilder: (context, index) {
                            var profissional = profissionais[index];
                            return ListTile(
                              leading: CircleAvatar(
                                  maxRadius: larguraIcone * 0.2,
                                  backgroundColor: HexColor('#260633'),
                                  child: Icon(
                                    Icons.person_outline_rounded,
                                    color: Colors.white,
                                  )),
                              title: Text(
                                '${profissional['titulo']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '${profissional['subtitulo']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
