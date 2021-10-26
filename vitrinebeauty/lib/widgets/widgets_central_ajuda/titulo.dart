import 'package:flutter/material.dart';

class Titulo extends StatelessWidget {
  final double alturaPadding;
  const Titulo(this.alturaPadding, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: alturaPadding * 0.2, bottom: alturaPadding * 0.1),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text(
              'CENTRAL',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const Text(
              'DE AJUDA',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
