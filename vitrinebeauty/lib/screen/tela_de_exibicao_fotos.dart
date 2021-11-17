import 'package:flutter/material.dart';

class TelaExibicao extends StatefulWidget {
  final int firstSelectedIndex;
  const TelaExibicao(this.firstSelectedIndex, {Key? key}) : super(key: key);

  @override
  _TelaExibicaoState createState() => _TelaExibicaoState();
}

class _TelaExibicaoState extends State<TelaExibicao> {
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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_imagens[_selectedIndex!]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            width: larguraTotal * 0.9,
            height: larguraTotal * 0.7,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
