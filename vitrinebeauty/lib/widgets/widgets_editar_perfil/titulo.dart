import 'package:flutter/material.dart';

class TituloEditarPerfil extends StatelessWidget {
  final double alturaPadding;
  const TituloEditarPerfil(this.alturaPadding, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: alturaPadding * 0.2),
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          'PERFIL',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
