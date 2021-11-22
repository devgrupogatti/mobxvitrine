import 'package:flutter/material.dart';
import 'package:vitrinebeauty/model/profissional.dart';

class InformacoesBasicas extends StatelessWidget {
  final Profissional profissionalSelecionado;
  const InformacoesBasicas(this.profissionalSelecionado, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.access_time,
              color: Colors.black,
            ),
            title: Transform(
              transform: Matrix4.translationValues(-30, 0.0, 0.0),
              child: Text(
                '${profissionalSelecionado.horario}',
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
                  '${profissionalSelecionado.endereco}',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
