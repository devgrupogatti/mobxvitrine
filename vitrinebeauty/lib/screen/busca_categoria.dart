// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vitrinebeauty/model/lista_profissionais.dart';
import 'package:vitrinebeauty/screen/perfil_profissional.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/widgets/pesquisa.dart';
import 'package:vitrinebeauty/widgets/widgets_busca/cab_busca.dart';
import 'package:vitrinebeauty/widgets/widgets_inicio/cab_inicio.dart';

class BuscaCategoria extends StatefulWidget {
  const BuscaCategoria({Key? key}) : super(key: key);

  @override
  _BuscaCategoriaState createState() => _BuscaCategoriaState();
}

class _BuscaCategoriaState extends State<BuscaCategoria> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaPadding = altura * 0.4;
    List<Map<String, String>> profissionais = Profissionais().profissionais;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: alturaPadding * 0.1,
          horizontal: largura * 0.04,
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
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
                    child: Text(
                      'CABELO',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: HexColor('#343a40'),
                      ),
                    ),
                  ),
                ),
                PesquisaProfissional(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: alturaPadding * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _botaoFiltro(Icons.star, 'Avaliação', 1),
                      _botaoFiltro(Icons.location_on, 'Distância', 2),
                      _botaoFiltro(Icons.attach_money_rounded, 'Preço', 3),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: alturaPadding * 0.1),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Profissionais disponíveis:',
                      style:
                          TextStyle(color: HexColor('#6c757d'), fontSize: 16),
                    ),
                  ),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: profissionais.length,
                    itemBuilder: (context, index) {
                      var profissional = profissionais[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return PerfilProfissional(
                                    profissional['titulo']);
                              },
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              maxRadius: larguraIcone * 0.2,
                              backgroundColor: HexColor('#ffffff'),
                              child: Image.asset(
                                'assets/images/favicon.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text(
                              '${profissional['titulo']}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${profissional['subtitulo']}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton _botaoFiltro(IconData icone, String titulo, int posicao) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Icon(
            icone,
            color: Colors.white,
            size: 18,
          ),
          Text(
            titulo,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        onPrimary: HexColor('#ffffff'),
        primary: HexColor('#0d6efd').withOpacity(0.9),
        shape: RoundedRectangleBorder(
            borderRadius: //BorderRadius.all(Radius.circular(0)),
                //BorderRadius.horizontal(left: Radius.circular(0))),
                posicao == 1
                    ? BorderRadius.horizontal(
                        left: Radius.circular(30.0), right: Radius.zero)
                    : posicao == 2
                        ? BorderRadius.horizontal(
                            left: Radius.zero, right: Radius.zero)
                        : BorderRadius.horizontal(
                            left: Radius.zero, right: Radius.circular(30.0))),
      ),
    );
  }
}
