// ignore_for_file: prefer_const_constructors, deprecated_member_use, unused_element, avoid_init_to_null, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';

class ApresentacaoPerfil extends StatefulWidget {
  const ApresentacaoPerfil({Key? key}) : super(key: key);

  @override
  _ApresentacaoPerfilState createState() => _ApresentacaoPerfilState();
}

class _ApresentacaoPerfilState extends State<ApresentacaoPerfil> {
  File? imagem = null;

  _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    PickedFile? imageFile = await _picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    // aqui da pra pegar da galeria tambem

    if (imageFile == null) return;
    setState(() {
      imagem = File(imageFile.path);
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
      imagem = File(imageFile.path);
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
    // double alturaPadding = altura * 0.4;
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
                      child: imagem != null
                          ? Image.file(
                              imagem!,
                              height: largura * 0.45,
                              width: largura * 0.45,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/cbimage.png',
                              height: largura * 0.45,
                              width: largura * 0.45,
                              // scale: largura * 0.5,
                              fit: BoxFit.cover,
                            ),
                    ),
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
                    'Dev Silva !',
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
}
//assets/images/
 /*

Container(
                    onPressed: _acessarFoto,
                    child: Image.asset(
                      'assets/images/editWelcomePic.png',
                      fit: BoxFit.cover,
                      //scale: ,
                      width: 30,
                      height: 30,
                    ),
                  ),


 Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: Image.asset(
              'assets/images/cbimage.png',
              height: altura * 0.3,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
 
 
 
 ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              child: Image.network(
                GerenciadorImagem().converterbase64ParaFile().toString(),
                height: altura * 0.3,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),*/