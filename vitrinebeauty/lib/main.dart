import 'package:flutter/material.dart';
// ignore_for_file: unnecessary_new, use_key_in_widget_constructors

import 'package:provider/provider.dart';
import 'package:vitrinebeauty/controller/auth_or_dashboard.dart';
import 'package:vitrinebeauty/model/conta_usuario.dart';
import 'package:vitrinebeauty/provider/autenticacao.dart';
import 'package:vitrinebeauty/provider/provider_vitrine.dart';
import 'package:vitrinebeauty/provider/requisicao_profissionais.dart';
import 'package:vitrinebeauty/screen/editar_perfil.dart';
import 'package:vitrinebeauty/screen/mudar_endereco.dart';
import 'package:vitrinebeauty/screen/vb_central_ajuda.dart';
import 'package:vitrinebeauty/screen/vb_endereco_cliente.dart';
import 'package:vitrinebeauty/utils/app_routes.dart';
import 'package:vitrinebeauty/view/cadastro.dart';
import 'package:vitrinebeauty/view/login.dart';

void main() {
  runApp(VitrineBeauty());
}

class VitrineBeauty extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Autenticacao(),
        ),
        ChangeNotifierProxyProvider<Autenticacao, ContaUsuario>(
          create: (_) =>
              new ContaUsuario(nome: null, idUser: null, token: null),
          update: (ctx, auth, conta) => new ContaUsuario(
            nome: auth.nomeUsuario,
            idUser: auth.userId,
            token: auth.token,
          ),
        ),
        ChangeNotifierProxyProvider<Autenticacao, VitrineController>(
          create: (_) => new VitrineController(
            nome: null,
            idUser: null,
            token: null,
          ),
          update: (ctx, auth, vitrineView) => new VitrineController(
            nome: auth.nomeUsuario,
            idUser: auth.userId,
            token: auth.token,
          ),
        ),
        ChangeNotifierProvider(create: (context) => ReqProfissionais()),
      ],
      child: MaterialApp(
        title: 'Vitrine Teste Beauty',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        //home: Login(),
        routes: {
          AppRoutes.AUTHOUVITRINE: (ctx) => AuthOrDash(),
          AppRoutes.LOGIN: (ctx) => Login(),
          AppRoutes.CADASTRO: (ctx) => Cadastro(),
          AppRoutes.VITRINEBEAUTY: (ctx) => VitrineBeauty(),
          AppRoutes.AJUDA: (ctx) => CentralAjuda(),
          AppRoutes.EDITARPERFIL: (ctx) => const EditarPerfil(),
          AppRoutes.ENDERECOCLIENTE: (ctx) => const EnderecoCliente(),
          AppRoutes.MUDARENDERECO: (ctx) => const MudarEndereco(),
        },
        // RecuperarSenha(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
