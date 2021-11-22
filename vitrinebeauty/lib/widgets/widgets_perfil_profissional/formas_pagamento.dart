import 'package:flutter/material.dart';

class FormasPagamento extends StatelessWidget {
  const FormasPagamento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaPadding = altura * 0.4;
    double alturaIcone = altura * 0.1;
    return Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: alturaIcone * 0.05),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: alturaIcone * 0.1, vertical: alturaIcone * 0.1),
              color: Colors.green.shade700,
              child: const Text(
                'Dinheiro',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: alturaIcone * 0.05),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: alturaIcone * 0.1, vertical: alturaIcone * 0.1),
              color: Colors.green.shade700,
              child: const Text(
                'Crédito',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: alturaIcone * 0.05),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: alturaIcone * 0.1, vertical: alturaIcone * 0.1),
              color: Colors.green.shade700,
              child: const Text(
                'Débito',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
