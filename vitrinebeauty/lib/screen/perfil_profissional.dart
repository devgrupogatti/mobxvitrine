// ignore_for_file: avoid_unnecessary_containers, unnecessary_const, prefer_const_constructors

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vitrinebeauty/controller/profissionais_busca_controller.dart';
import 'package:vitrinebeauty/controller/servico_controller.dart';
import 'package:vitrinebeauty/model/profissional.dart';
import 'package:vitrinebeauty/screen/agendamento.dart';
import 'package:vitrinebeauty/utils/adaptative_text_size.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/widgets/widgets_busca/card_categorias_busca.dart';
import 'package:vitrinebeauty/widgets/widgets_perfil_profissional/galeria_profissional.dart';

class PerfilProfissional extends StatefulWidget {
  final int? identificador;
  const PerfilProfissional(this.identificador, {Key? key}) : super(key: key);
  //final String? nomeEmpresa;
  //Profissional? profissional;
  //const PerfilProfissional(this.profissional, {Key? key}) : super(key: key);

  @override
  _PerfilProfissionalState createState() => _PerfilProfissionalState();
}

class _PerfilProfissionalState extends State<PerfilProfissional> {
  Profissional? profissionalSelecionado;
  final listaServico = ServicoControllerStore();

  @override
  void initState() {
    // TODO: implement initState
    // listaServico.listaServico.addAll(
    //     Provider.of<ProfissionaisBuscaController>(context, listen: false)
    //         .profissionaisSelecionados);

    super.initState();
    profissionalSelecionado =
        Provider.of<ProfissionaisBuscaController>(context, listen: false)
            .retornarProfissionalSelecionado(widget.identificador);

    for (var element in profissionalSelecionado!.servicos!) {
      listaServico.listaServico.add(element);
    }
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaPadding = altura * 0.4;
    double alturaIcone = altura * 0.1;
    List<Profissional> profissionais =
        ProfissionaisBuscaController().profissionaisSelecionados;
    return Scaffold(
      backgroundColor: Colors.white,
      //  color: HexColor('#260633'),

      body: SingleChildScrollView(
        child: Container(
          // height: altura * 2,

          child: Column(
            children: [
              Container(
                // height: al,
                color: Colors.white,
                height: altura * 0.5,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          height: altura * 0.3,
                          color: HexColor('#260633'),
                          child: _botaoRetornar(alturaPadding, largura),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: altura * 0.16),
                          child: Container(
                            alignment: Alignment.center,
                            child: _imagemProfissional(larguraIcone),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              _nomeProfissional(alturaPadding),
              _listagem(alturaPadding, alturaIcone),
            ],
          ),
        ),
      ),
    );
  }

// ****
// ****
// ****
// ****
// ****
// ****

  Widget _imagemProfissional(double larguraIcone) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: HexColor('#260633'), width: 4.0),
        borderRadius: BorderRadius.circular(100),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: larguraIcone * 0.45,
        child: Container(
          child: Image.asset(
            'assets/images/favicon.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

// *********
// *********
// **********
// ********
// ********

  Widget _nomeProfissional(double alturaPadding) {
    return Padding(
      padding: EdgeInsets.only(bottom: alturaPadding * 0.1),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          // '${profissional.nome}',
          '${profissionalSelecionado!.nome}',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _botaoRetornar(double alturaPadding, double largura) {
    return Padding(
      padding: EdgeInsets.only(
        left: largura * 0.04,
        right: largura * 0.04,
      ),
      child: Container(
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
    );
  }

// *****
// *****
// *****
  Widget _listagem(double alturaPadding, double alturaIcone) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(
              Icons.access_time,
              color: Colors.black,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-30, 0.0, 0.0),
              child: Text(
                '${profissionalSelecionado!.horario}',
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(0.0, -15.0, 0.0),
            child: ListTile(
              leading: const Icon(
                Icons.account_balance_wallet,
                color: Colors.black,
              ),
              title: Transform(
                transform: Matrix4.translationValues(-30, 0.0, 0.0),
                child: const Text(
                  'Formas de pagamento',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(0.0, -30.0, 0.0),
            child: ListTile(
              leading: const Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              title: Transform(
                transform: Matrix4.translationValues(-30, 0.0, 0.0),
                child: Text(
                  '${profissionalSelecionado!.endereco}',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: alturaIcone * 0.4,
              right: alturaIcone * 0.4,
            ),
            //bottom: alturaIcone * 0.4
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: alturaIcone * 0.1),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Olá!',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Reiciendis sapiente eligendi quod, quia voluptatum deserunt sint cum mollitia iste aut architecto provident error, libero excepturi dicta laboriosam pariatur corporis neque!',
                      style: TextStyle(
                        fontSize: const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 16),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: alturaPadding * 0.08),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Serviços',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: HexColor('#260633'),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: alturaIcone * 0.1),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: [
                          Observer(
                            builder: (_) => Column(
                              children: [
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: listaServico.listaServico.length,
                                  itemBuilder: (context, index) {
                                    var servico =
                                        listaServico.listaServico[index];
                                    return Column(
                                      children: [
                                        DottedLine(
                                          dashLength: 2,
                                          dashColor: Colors.transparent,
                                          dashGapColor: Colors.pink.shade200,
                                        ),
                                        CheckboxListTile(
                                          title: Text('${servico.nome}'),
                                          //onTap: () {},
                                          secondary: Text(
                                            'R\$ ${servico.preco}0',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.grey.shade700,
                                            ),
                                          ),
                                          // secondary: const Icon(
                                          //   Icons.person_rounded,
                                          //   color: Colors.purple,
                                          // ),
                                          //onTap: _retornarDados,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          value: servico.status,
                                          onChanged: (value) {
                                            setState(() {
                                              // servico.status !=
                                              //     servico.status;
                                              listaServico.changeChecked(index);
                                              // listaServico.somatorio();
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: alturaPadding * 0.1),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Text(
                                        'Valor : ',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        'R\$ ${listaServico.valorTotal}',
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Observer(
                            builder: (_) => Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: alturaPadding * 0.05),
                              child: Container(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    onPrimary: HexColor('#ffffff'),
                                    primary: listaServico.habilitado
                                        ? HexColor('#1818ff').withOpacity(0.9)
                                        : Colors.grey,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(29)),
                                    ),
                                  ),
                                  onPressed: listaServico.habilitado
                                      ? () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                // return PerfilProfissional(
                                                //     profissional['titulo']);
                                                //return PerfilProfissional(profissional);
                                                return Agendamento(
                                                    listaServico
                                                        .servicosSelecionados,
                                                    listaServico.valorTotal,
                                                    profissionalSelecionado!
                                                        .nome,
                                                    profissionalSelecionado!
                                                        .endereco);
                                                ;
                                              },
                                            ),
                                          );
                                        }
                                      : () {},
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: alturaIcone * 0.1),
                                          child:
                                              Icon(Icons.perm_contact_calendar),
                                        ),
                                        Text(
                                          'Agendar Serviços',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      //_listaServico(),
                      // child: const Text(
                      //   'Serviços',
                      //   style: TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 25.0,
                      //       fontWeight: FontWeight.w400),
                      // ),
                    ),
                  ),
                  DottedLine(
                    dashLength: 2,
                    dashColor: Colors.transparent,
                    dashGapColor: Colors.pink.shade200,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: alturaPadding * 0.2),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Fotos',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: HexColor('#260633'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: alturaPadding * 0.05),
                            child: const GaleriaFotos(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// depois de selecionar os serviços um pop up abrirá e ira pedir a data e o horario e assim sera
//redirecionado a tela do  detalhe do agendamento .
