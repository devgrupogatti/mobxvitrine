class EstrelaAvaliacao {
  int? nEstrelaCheia;
  bool? contemEstrela;
  bool? contemMeiaEstrela;

  init(double? avaliacao, String? nome) {
    // nEstrela = avaliacao;
    for (double i = 1.0; i < 6.0; i++) {
      if (avaliacao! <= i) {
        print('avalicao : $avaliacao e count : $i');
        compare(avaliacao, i);
        i = 7;
      }
    }
  }

  compare(double nota, double modulo) {
    if (nota <= modulo) {
      if (nota == modulo) {
        contemEstrela = true;
        contemMeiaEstrela = false;
        nEstrelaCheia = nota.round();
      } else if (nota < modulo) {
        contemEstrela = true;
        contemMeiaEstrela = true;
        nEstrelaCheia = (nota - (nota % (modulo - 1))).round();
      }
    }

    print(' quantidade de estrela cheia $nEstrelaCheia');
  }
}




// if (avaliacao! <= 1.0) {
//       if (avaliacao < 1) {
//         contemEstrela = false;
//         contemMeiaEstrela = true;
//       } else {
//         contemEstrela = true;
//         contemMeiaEstrela = false;
//       }
//     } else {
// // avaliacao % i == 0 && avaliacao/i==1
//       double count = 1.0;

//       do {
//         count++;
//       } while (avaliacao > count);

      

//       if (avaliacao! % 5 == 0) {
//         nEstrelaCheia = avaliacao;
//         contemEstrela = true;
//         contemMeiaEstrela = false;
//       } else {
//         if (avaliacao % 4 == 0) {}
//       }
//     }