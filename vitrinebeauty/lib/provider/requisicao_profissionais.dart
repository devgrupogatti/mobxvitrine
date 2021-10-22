import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ReqProfissionais with ChangeNotifier {
  Future<void> retornarPesquisaProfissionais(String pesquisa) async {
    var uri = Uri.parse('https://vbproviders.vitrinebeauty.com/api/login');
    var resposta = await http.post(uri,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({}));
    Map<String, dynamic> data = jsonDecode(resposta.body);
    notifyListeners();
    //return Future.value();
  }
}
/*
urls consulta:
https://github.com/ICEI-PUC-Minas-PPLES-TI/plf-es-2021-1-ti5-6702100-leil-on/blob/master/codigo/mobile/Leil_on/lib/model/item.dart
https://github.com/ICEI-PUC-Minas-PPLES-TI/plf-es-2021-1-ti5-6702100-leil-on/blob/master/codigo/mobile/Leil_on/lib/controller/listagem.dart
https://github.com/ICEI-PUC-Minas-PPLES-TI/plf-es-2021-1-ti5-6702100-leil-on/blob/master/codigo/mobile/Leil_on/lib/view/telaDePesquisa.dart
https://github.com/ICEI-PUC-Minas-PPLES-TI/plf-es-2021-1-ti5-6702100-leil-on/blob/master/codigo/mobile/Leil_on/lib/widget/cardItem.dart
 */