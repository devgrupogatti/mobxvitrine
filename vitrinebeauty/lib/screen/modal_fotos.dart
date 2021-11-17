// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';

class ModalFotos extends StatefulWidget {
  final int firstSelectedIndex;
  const ModalFotos(this.firstSelectedIndex, {Key? key}) : super(key: key);

  @override
  _ModalFotosState createState() => _ModalFotosState();
}

class _ModalFotosState extends State<ModalFotos> {
  final List<String> _imagens = [
    'assets/images/Depilação-banner-APP.png',
    'assets/images/Maquiagem-banner-APP.png',
    'assets/images/Sobrancelha-banner-APP.png',
    'assets/images/SPA-banner-APP.png',
    'assets/images/Unhas-banner-APP.png',
    'assets/images/Sobrancelha-banner-APP.png',
    'assets/images/SPA-banner-APP.png',
    'assets/images/Unhas-banner-APP.png',
  ];

  String? _storedImage;
  //int? _selectedIndex;
  int? _selectedIndex;

  @override
  void initState() {
    // TODO: implement initState
    _selectedIndex = widget.firstSelectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final larguraTotal = MediaQuery.of(context).size.width;
    final alturaTotal = MediaQuery.of(context).size.height;
    double alturaPadding = alturaTotal * 0.4;
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: HexColor('#260633'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: alturaPadding * 0.1,
                left: larguraTotal * 0.04,
                right: larguraTotal * 0.04,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    elevation: 7.0,
                    shape: const CircleBorder(),
                    minimumSize: const Size(40, 40),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.pink[300],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: alturaPadding * 0.1),
              child: Container(
                width: double.infinity,
                child: _fotoAmpliada(
                    larguraTotal, alturaTotal * 0.5, larguraTotal * 0.5),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              width: larguraTotal * 0.9,
              height: larguraTotal * 0.7,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  crossAxisCount: 4,
                ),
                itemCount: _imagens.length,
                itemBuilder: (context, index) {
                  // Item rendering
                  var inicio = _imagens[index];
                  return _criarFotoConainer(larguraTotal * 0.2,
                      larguraTotal * 0.2, alturaTotal * 0.05, inicio, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _alternarFoto(int indice) {
    setState(() {
      _selectedIndex = indice;

      print('indice selecionado agora eh ' + _selectedIndex.toString());
      // _imagens[0] = imagem!;
      // _imagens[indice] = _storedImage!;
    });
  }

  Widget _fotoAmpliada(double largura, double altura, double tamanhoIcone) {
    // int indiceSelecionado = _selectedIndex!;
    return InkWell(
      onTap: () {},
      child: Container(
        // width: largura,
        width: double.infinity,
        height: altura,
        alignment: Alignment.topCenter,
        // margin: EdgeInsets.symmetric(horizontal: largura * 0.05),
        child: _imagens[_selectedIndex!] != null
            ? Image.asset(
                _imagens[_selectedIndex!],
                height: largura,
                width: largura,
                fit: BoxFit.cover,
              )
            : Icon(
                Icons.image,
                color: Colors.white,
                size: tamanhoIcone,
              ),
      ),
    );
  }

  Widget _criarFotoConainer(double largura, double altura, double tamanhoIcone,
      String? imagem, int indice) {
    return InkWell(
      onTap: () {
        _alternarFoto(indice);
      },
      child: Container(
        width: largura,
        height: altura,
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: largura * 0.05),
        child: imagem != null
            ? Image.asset(
                _imagens[indice],
                height: largura,
                width: largura,
                fit: BoxFit.cover,
              )
            : Icon(
                Icons.image,
                color: Colors.white,
                size: tamanhoIcone,
              ),
      ),
    );
  }
}
// Padding(
//               padding: EdgeInsets.symmetric(vertical: alturaPadding * 0.1),
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(
//                       // top: alturaPadding * 0.1,
//                       left: larguraTotal * 0.04,
//                       right: larguraTotal * 0.04,
//                     ),
//                     child: Container(
//                       alignment: Alignment.centerLeft,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.white,
//                           elevation: 7.0,
//                           shape: const CircleBorder(),
//                           minimumSize: const Size(40, 40),
//                         ),
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Icon(
//                           Icons.arrow_back_ios_new_rounded,
//                           color: Colors.pink[300],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Transform(
//                     transform: Matrix4.translationValues(25.0, 0.0, 0.0),
//                     child: SizedBox(
//                       height: larguraTotal * 0.2,
//                       child: Image.asset(
//                         'assets/images/image_vb.png',
//                         width: larguraTotal * 0.4,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),