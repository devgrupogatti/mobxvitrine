// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vitrinebeauty/widgets/widgets_busca/card_categorias_busca.dart';

class GaleriaFotos extends StatefulWidget {
  const GaleriaFotos({Key? key}) : super(key: key);

  @override
  _GaleriaFotosState createState() => _GaleriaFotosState();
}

class _GaleriaFotosState extends State<GaleriaFotos> {
  String? _storedImage;
  //int? _selectedIndex;
  int _selectedIndex = 1;
  // List<File> _imagens = [

  // ];
  List<String> _imagens = [
    'assets/images/Depilação-banner-APP.png',
    'assets/images/Maquiagem-banner-APP.png',
    'assets/images/Sobrancelha-banner-APP.png',
    'assets/images/SPA-banner-APP.png',
    'assets/images/Unhas-banner-APP.png',
    'assets/images/Sobrancelha-banner-APP.png',
    'assets/images/SPA-banner-APP.png',
    'assets/images/Unhas-banner-APP.png',
  ];

  // @override
  // void initState() {
  //   // TODO: implement initState

  //   super.initState();
  //   _selectedIndex = 9;
  // }

  _alternarFoto(String? imagem, int indice) {
    setState(() {
      _selectedIndex = indice;

      print('indice selecionado agora eh ' + _selectedIndex.toString());
      // _imagens[0] = imagem!;
      // _imagens[indice] = _storedImage!;
    });
  }

  Widget _criarFotoConainer(double largura, double altura, double tamanhoIcone,
      String? imagem, int indice) {
    return Container(
      width: largura,
      height: altura,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: largura * 0.05),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     width: 3.0,
      //     color: Colors.purple,
      //   ),
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
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
        onPressed: () {
          _alternarFoto(imagem, indice);
        },
      ),
    );
  }

  Widget _fotos() {
    return Center();
  }

  @override
  Widget build(BuildContext context) {
    final larguraTotal = MediaQuery.of(context).size.width;
    final alturaTotal = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.topCenter,
      width: larguraTotal * 0.9,
      height: larguraTotal * 0.8,
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
          return _criarFotoConainer(larguraTotal * 0.2, larguraTotal * 0.2,
              alturaTotal * 0.05, inicio, index);
        },
      ),
    );
  }

  Widget _FotoConainer(
      double largura, double altura, double tamanhoIcone, String? imagem) {
    return Container(
      width: largura,
      height: altura,
      alignment: Alignment.center,
      // margin: EdgeInsets.symmetric(horizontal: largura * 0.1),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3.0,
          color: Colors.purple,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        child: imagem != null
            ? Image.asset(
                _imagens[_selectedIndex],
                fit: BoxFit.cover,
              )
            : Icon(
                Icons.image,
                color: Colors.white,
                size: tamanhoIcone,
              ),
        onPressed: () {},
      ),
    );
  }
}



// Column(
//         // mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             width: larguraTotal * 0.9,
//             height: larguraTotal * 0.2,
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: _imagens.length,
//                 itemBuilder: (context, index) {
//                   var inicio = _imagens[index];
//                   return _criarFotoConainer(larguraTotal * 0.2,
//                       larguraTotal * 0.2, alturaTotal * 0.05, inicio, index);
//                 }),
//           ),
//           Container(
//             alignment: Alignment.topCenter,
//             width: larguraTotal * 0.9,
//             height: larguraTotal * 0.25,
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount: _imagens.length,
//                 itemBuilder: (context, index) {
//                   var inicio = _imagens[index];
//                   return _criarFotoConainer(larguraTotal * 0.2,
//                       larguraTotal * 0.2, alturaTotal * 0.05, inicio, index);
//                 }),
//           ),
//         ],
//       ),



// GridView(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 200,
//           childAspectRatio: 4,
//           crossAxisSpacing: 1,
//           mainAxisSpacing: 5,
//         ),
//         children: imagens.map((imagem) {
//           return InkWell(onTap: () {}, child: CardBuscaCategoria(imagem));
//         }).toList(),
//       ),



// Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _criarFotoConainer(larguraTotal * 0.2, larguraTotal * 0.2,
//                         alturaTotal * 0.05, _imagens[1], 1),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     _criarFotoConainer(larguraTotal * 0.2, larguraTotal * 0.2,
//                         alturaTotal * 0.05, _imagens[2], 2),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     _criarFotoConainer(larguraTotal * 0.2, larguraTotal * 0.2,
//                         alturaTotal * 0.05, _imagens[3], 3),
//                     SizedBox(
//                       height: 10,
//                     ),
//                   ],
//                 ),
//                 _FotoConainer(larguraTotal * 0.5, alturaTotal * 0.35,
//                     alturaTotal * 0.15, _imagens[_selectedIndex])
//               ],
//             )
//           ],
//         ),
//         SizedBox(
//           height: 10,
//         ),
//       ],
//     );
