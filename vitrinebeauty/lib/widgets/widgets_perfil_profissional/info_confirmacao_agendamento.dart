import 'package:flutter/material.dart';

class InfoConfAgendamento extends StatelessWidget {
  final double valorServico;
  final String? enderecoServico;
  const InfoConfAgendamento(this.valorServico, this.enderecoServico, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaPadding = altura * 0.4;
    double alturaIcone = altura * 0.1;
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Valor total dos serviços selecionados :',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: alturaIcone * 0.3),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'R\$${valorServico.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              'Endereço:',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: alturaIcone * 0.3),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                enderecoServico!,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
