import 'package:flutter/material.dart';
import 'package:vitrinebeauty/utils/app_routes.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';

class CabBusca extends StatefulWidget {
  const CabBusca({Key? key}) : super(key: key);

  @override
  _CabBuscaState createState() => _CabBuscaState();
}

class _CabBuscaState extends State<CabBusca> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaIcone = altura * 0.1;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: alturaIcone * 0.3),
          child: Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Olá, Vera Doe',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          child: Transform(
            transform: Matrix4.translationValues(-6, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: HexColor('#1800ff'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.ENDERECOCLIENTE);
                      },
                      child: Container(
                        // alignment: Alignment.centerLeft,
                        width: largura * 0.5,
                        child: const Text(
                          'Bravadžiluk, Sarajevo, Bósnia e Herzegovina',
                          style: TextStyle(
                            fontSize: 13.0,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notification_important_rounded),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
