import 'package:flutter/material.dart';
import 'package:vitrinebeauty/utils/app_routes.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/widgets/widgets_central_ajuda/titulo_campo.dart';
import 'package:vitrinebeauty/widgets/widgets_endereco/texto_tela_endereco.dart';

class EnderecoCliente extends StatefulWidget {
  const EnderecoCliente({Key? key}) : super(key: key);

  @override
  _EnderecoClienteState createState() => _EnderecoClienteState();
}

class _EnderecoClienteState extends State<EnderecoCliente> {
  List<String> enderecos = [
    'Avenida Raja Gabaglia, 2000 - Estoril, Belo Horizonte - MG, Brasil',
    'Avenida Raja Gabaglia, 2000 - Estoril, Belo Horizonte - MG, Brasil',
    'Avenida Raja Gabaglia, 2000 - Estoril, Belo Horizonte - MG, Brasil',
    'Avenida Raja Gabaglia, 2000 - Estoril, Belo Horizonte - MG, Brasil',
    'Avenida Raja Gabaglia, 2000 - Estoril, Belo Horizonte - MG, Brasil',
    'Avenida Raja Gabaglia, 2000 - Estoril, Belo Horizonte - MG, Brasil',
  ];

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaIcone = altura * 0.1;
    double alturaPadding = altura * 0.4;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: alturaPadding * 0.2,
            left: largura * 0.1,
            right: largura * 0.1,
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
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          'MEUS ENDEREÇOS',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: alturaPadding * 0.1),
                        child: TextoEndereco(
                            'Avenida Raja Gabaglia, 3348 - Estoril, Belo Horizonte - MG, Brasil',
                            alturaPadding),
                      ),
                      Container(
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: enderecos.length,
                            itemBuilder: (ctx, index) {
                              final endereco = enderecos[index];
                              return Container(
                                child: Card(
                                  elevation: 4,
                                  child: ListTile(
                                    title: Transform(
                                      transform: Matrix4.translationValues(
                                          16, 0.0, 0.0),
                                      child: Text(
                                        endereco,
                                        style: const TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    trailing: Transform(
                                      transform: Matrix4.translationValues(
                                          10, 0.0, 0.0),
                                      child: IconButton(
                                        iconSize: 20,
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: alturaPadding * 0.1),
                        child: Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onPrimary: HexColor('#198754'),
                              primary: HexColor('#76FFDA').withOpacity(0.9),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(29)),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.MUDARENDERECO);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              child: const Text(
                                'Mudar Endereço',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // _campoTexto(altura, largura,
                      //     'Avenida Raja Gabaglia, 2000 - Estoril, Belo Horizonte - MG, Brasil'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
