// ignore_for_file: prefer_const_constructors, deprecated_member_use, unused_element, avoid_init_to_null, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:vitrinebeauty/model/conta_usuario.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';

class ApresentacaoPerfil extends StatefulWidget {
  const ApresentacaoPerfil({Key? key}) : super(key: key);

  @override
  _ApresentacaoPerfilState createState() => _ApresentacaoPerfilState();
}

class _ApresentacaoPerfilState extends State<ApresentacaoPerfil> {
  Uint8List? imagem;
  File? novaImagem;
  String? nome;
  bool _isTiked = false;
  @override
  void initState() {
    super.initState();
  }

  _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    PickedFile? imageFile = await _picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    // aqui da pra pegar da galeria tambem

    if (imageFile == null) return;
    setState(() {
      novaImagem = File(imageFile.path);
      _isTiked = true;
      //Provider.of<CadastroItem>(context, listen: false)
      //  .adicionarFoto(File(imageFile.path));
      //_storedImage = File(imageFile.path);
    });
  }

  _galleryPicture() async {
    final ImagePicker _picker = ImagePicker();
    PickedFile? imageFile = await _picker.getImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );

    // aqui da pra pegar da galeria tambem

    if (imageFile == null) return;
    setState(() {
      novaImagem = File(imageFile.path);
      _isTiked = true;
      //Provider.of<CadastroItem>(context, listen: false)
      //  .adicionarFoto(File(imageFile.path));
      //_storedImage = File(imageFile.path);
    });
  }

  void _acessarFoto() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Opções: '),
        // content: Text('Será retornado para a tela de login'),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FlatButton.icon(
                  label: Text('Tirar foto'),
                  icon: Icon(
                    Icons.add_a_photo,
                    size: 30.0,
                    color: Colors.purple[800],
                  ),
                  onPressed: _takePicture,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: FlatButton.icon(
                  label: Text('Galeria'),
                  icon: Icon(
                    Icons.add_photo_alternate,
                    size: 30.0,
                    color: Colors.purple[800],
                  ),
                  onPressed: _galleryPicture,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    // double larguraIcone = largura * 0.5;
    // double larguraPadding = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaIcone = altura * 0.1;
    ContaUsuario? conta = Provider.of<ContaUsuario>(context);
    nome = conta.nome;
    imagem = conta.imagemPerfil;

    return Container(
      // width: largura * 0.95,
      width: double.infinity,
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Container(
              height: altura * 0.3,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: HexColor('#1800ff'), width: 6.0),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: _isTiked
                            ? _isTiked
                                ? _imagemTirada(novaImagem!, largura)
                                : _imagemApi(imagem!, largura)
                            : _imagemApi(imagem!, largura)),
                  ),
                  Positioned(
                      left: alturaIcone * 1.9,
                      top: alturaIcone * 1.9,
                      width: alturaIcone * 0.95,
                      height: alturaIcone * 0.95,
                      child: IconButton(
                        icon: Image.asset(
                          'assets/images/editWelcomePic.png',
                          // width: 80,
                          // height: 80,
                          width: alturaIcone,
                          height: alturaIcone,
                          fit: BoxFit.cover,
                        ),
                        iconSize: alturaIcone,
                        onPressed: _acessarFoto,
                      )
                      /*Image.asset(
                      'assets/images/editWelcomePic.png',
                      width: 90,
                      height: 90,
                    ),*/

                      ),
                ],
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(0.0, 20.0, 0.0),
              child: Padding(
                padding: EdgeInsets.only(top: alturaIcone * 0.4),
                child: Container(
                  child: Text(
                    // 'Olá, Pedro Silva',
                    'Olá, $nome !',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Image _imagemApi(Uint8List imagem, double largura) {
    return Image.memory(
      imagem,
      height: largura * 0.45,
      width: largura * 0.45,
      fit: BoxFit.cover,
    );
  }

  Image _imagemTirada(File novaImagem, double largura) {
    return Image.file(
      novaImagem,
      height: largura * 0.45,
      width: largura * 0.45,
      fit: BoxFit.cover,
    );
  }

  Image _imagemPadrao(Uint8List? imagem, File? novaImagem, double largura) {
    return Image.asset(
      'assets/images/cbimage.png',
      height: largura * 0.45,
      width: largura * 0.45,
      // scale: largura * 0.5,
      fit: BoxFit.cover,
    );
  }
}
