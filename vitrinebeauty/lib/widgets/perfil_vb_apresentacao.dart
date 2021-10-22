// ignore_for_file: prefer_const_constructors, deprecated_member_use, unused_element, avoid_init_to_null

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';

class ApresentacaoPerfil extends StatefulWidget {
  //  const ApresentacaoPerfil({ Key? key }) : super(key: key);

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
    double larguraIcone = largura * 0.5;
    double larguraPadding = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaIcone = altura * 0.1;
    double alturaPadding = altura * 0.4;
    return Container(
      width: largura * 0.95,
      child: InkWell(
        onTap: () {},
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: HexColor('#1800ff'), width: 6.0),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: imagem != null
                        ? Image.file(
                            imagem!,
                            height: largura * 0.4,
                            width: largura * 0.4,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/cbimage.png',
                            height: largura * 0.3,
                            width: largura * 0.3,
                            // scale: largura * 0.5,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                    left: 75,
                    top: 75,
                    width: 70,
                    height: 70,
                    child: IconButton(
                      icon: Image.asset(
                        'assets/images/editWelcomePic.png',
                        width: 150,
                        height: 150,
                      ),
                      iconSize: 70,
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
            Padding(
              padding: const EdgeInsets.only(top: 20),
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