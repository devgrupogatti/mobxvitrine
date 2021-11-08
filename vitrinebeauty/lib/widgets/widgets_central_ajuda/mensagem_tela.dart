import 'package:flutter/material.dart';
import 'package:vitrinebeauty/utils/adaptative_text_size.dart';

class MensagemTela extends StatelessWidget {
  const MensagemTela({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Text(
            'Olá! Esse espaço é especificamente para nós podermos te ouvir sobre eventuais situações que não te agradaram.',
            style: TextStyle(
              fontSize:
                  const AdaptiveTextSize().getadaptiveTextSize(context, 12),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
