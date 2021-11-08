// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_const, prefer_final_fields, unused_element

import 'package:flutter/material.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';

class PesquisaProfissional extends StatefulWidget {
  const PesquisaProfissional({Key? key}) : super(key: key);

  @override
  _PesquisaProfissionalState createState() => _PesquisaProfissionalState();
}

class _PesquisaProfissionalState extends State<PesquisaProfissional> {
  GlobalKey<FormState> _form = GlobalKey();
  String pesquisa = '';

  _pesquisar() {
    _form.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _form,
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Buscar por profissional ou serviço',
            labelStyle: TextStyle(
              fontStyle: FontStyle.italic,
              //fontSize: 15,
              //color: Colors.black,
            ),
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 6.0),
              borderRadius: const BorderRadius.all(
                const Radius.circular(30.0),
              ),
            ),
            filled: true,
            hintStyle:
                TextStyle(color: Colors.grey[800], fontStyle: FontStyle.italic),
            hintText: 'Buscar por profissional ou serviço',
            fillColor: Colors.white70,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: HexColor('#1800ff'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
decoration: new InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(30.0),
                ),
              ),
              filled: true,
              hintStyle: new TextStyle(
                  color: Colors.grey[800], fontStyle: FontStyle.italic),
              hintText: nomeCampo,
              fillColor: Colors.white70,
            ),
*/