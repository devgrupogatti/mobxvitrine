import 'package:flutter/material.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';

class PerfilProfissional extends StatefulWidget {
  final String? nomeEmpresa;
  const PerfilProfissional(this.nomeEmpresa, {Key? key}) : super(key: key);

  @override
  _PerfilProfissionalState createState() => _PerfilProfissionalState();
}

class _PerfilProfissionalState extends State<PerfilProfissional> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaPadding = altura * 0.4;
    double alturaIcone = altura * 0.1;
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
                  height: altura * 0.8,
                ),
              ),
              Positioned(
                left: largura * 0.25,
                top: alturaIcone * 1.3,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: HexColor('#260633'), width: 4.0),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: larguraIcone * 0.5,
                    child: Container(
                      child: Image.asset(
                        'assets/images/favicon.png',
                        fit: BoxFit.cover,
                      ),
                    ),
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
