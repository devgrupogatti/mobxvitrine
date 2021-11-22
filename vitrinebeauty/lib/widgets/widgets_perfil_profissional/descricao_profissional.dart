import 'package:flutter/material.dart';
import 'package:vitrinebeauty/utils/adaptative_text_size.dart';

class DescricaoProfissional extends StatelessWidget {
  const DescricaoProfissional({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaPadding = altura * 0.4;
    double alturaIcone = altura * 0.1;
    return Container(
      alignment: Alignment.center,
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
                fontSize:
                    const AdaptiveTextSize().getadaptiveTextSize(context, 16),
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
