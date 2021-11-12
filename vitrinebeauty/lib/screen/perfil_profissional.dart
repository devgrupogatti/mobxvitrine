// ignore_for_file: avoid_unnecessary_containers, unnecessary_const

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitrinebeauty/controller/profissionais_busca_controller.dart';
import 'package:vitrinebeauty/model/profissional.dart';
import 'package:vitrinebeauty/utils/adaptative_text_size.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';

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
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    profissionalSelecionado =
        Provider.of<ProfissionaisBuscaController>(context, listen: false)
            .retornarProfissionalSelecionado(widget.identificador);
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
      body: SingleChildScrollView(
        child: Container(
          color: HexColor('#260633'),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: alturaPadding * 0.1,
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
              ),
              Padding(
                padding: EdgeInsets.only(top: alturaPadding * 0.7),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  height: altura * 1.2,
                ),
              ),
              Positioned(
                left: largura * 0.25,
                top: alturaIcone * 1.3,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#260633'), width: 4.0),
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
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: alturaPadding * 0.1),
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
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: alturaPadding * 1.25),
                child: Container(
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
                                padding:
                                    EdgeInsets.only(bottom: alturaIcone * 0.1),
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
                                padding: EdgeInsets.symmetric(
                                    vertical: alturaPadding * 0.08),
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
                                padding:
                                    EdgeInsets.only(bottom: alturaIcone * 0.1),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: profissionalSelecionado!
                                          .servicos!.length,
                                      itemBuilder: (context, index) {
                                        final servico = profissionalSelecionado!
                                            .servicos![index];

                                        // return Text('Item 1 ');
                                        return Column(
                                          children: [
                                            DottedLine(
                                              dashLength: 2,
                                              dashColor: Colors.transparent,
                                              dashGapColor:
                                                  Colors.pink.shade200,
                                            ),
                                            CheckboxListTile(
                                              title: Text('${servico['tipo']}'),
                                              //onTap: () {},
                                              secondary: Icon(
                                                Icons.person_rounded,
                                                color: Colors.purple,
                                              ),
                                              //onTap: _retornarDados,
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                              value: false,
                                              onChanged: (value) {
                                                setState(() {
                                                  print('shulambs');
                                                });
                                              },
                                            ),
                                          ],
                                        );
                                      }),
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
        ),
      ),
    );
  }
}
