// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vitrinebeauty/provider/autenticacao.dart';
import 'package:vitrinebeauty/view/login.dart';
import 'package:vitrinebeauty/view/vb_dash.dart';

class AuthOrDash extends StatelessWidget {
  //const AuthOrDash({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Auth autenticado=Provider.of<Autenticacao>(context);
    Autenticacao auth = Provider.of(context);
    //return auth.isAuth ? VitrineBeauty() : Login();
    return auth.isAuth ? Login() : VBTabScreren();
    //return auth.isAuth ? Login() : PerfilVB(); // VBTabScreren();
  }
}
