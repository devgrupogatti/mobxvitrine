import 'package:flutter/cupertino.dart';
import 'package:vitrinebeauty/model/card_profissional.dart';

class Profissionais with ChangeNotifier {
  Profissionais();

  List<CardProfissional> profissionais = [
    CardProfissional(
        id: 11,
        titulo: 'Barbearia AC',
        distancia: 100.0,
        // servicos: ['Corte de cabelo', 'Depilacao', 'Sobrancelha'],
        avaliacao: 4.5),
    CardProfissional(
        id: 12,
        titulo: 'Estabelecimento teste',
        distancia: 22.0,
        //servicos: ['Corte de cabelo', 'Depilacao'],
        avaliacao: 4.0),
    CardProfissional(
        id: 13,
        titulo: 'Bento massagista',
        distancia: 12.0,
        //servicos: ['massagem'],
        avaliacao: 4.6),
    CardProfissional(
        id: 14, titulo: 'Andre desginer', distancia: 23.0, avaliacao: 4.7),
    CardProfissional(
        id: 15, titulo: 'Thais designer', distancia: 16.0, avaliacao: 4.8),
    CardProfissional(
        id: 16, titulo: 'Thais sombrancelhas', distancia: 12.0, avaliacao: 4.6),
    CardProfissional(
        id: 17, titulo: 'New Hair', distancia: 9.0, avaliacao: 4.8),
    CardProfissional(
        id: 18, titulo: 'Marcelo', distancia: 12.0, avaliacao: 4.5),
  ];

  // List<Map<String, String>> profissionais = [
  //   {
  //     //'id': 1,
  //     'titulo': 'Barbearia AC',
  //     'distancia': '100km',

  //     'avaliacao': '4.5',
  //     'imagem': '',
  //   },
  //   {
  //     'titulo': 'Estabelecimento teste',
  //     'subtitulo': '22 km',
  //     'imagem': '',
  //   },
  //   {
  //     'titulo': 'Bento massagista',
  //     'subtitulo': '12 km',
  //     'imagem': '',
  //   },
  //   {
  //     'titulo': 'Andre designer',
  //     'subtitulo': '9 km',
  //     'imagem': '',
  //   },
  //   {
  //     'titulo': 'Marcelo',
  //     'subtitulo': '1.5 km',
  //     'imagem': '',
  //   },
  //   {
  //     'titulo': 'Thais design de sobrancelhas',
  //     'subtitulo': '5.4 km',
  //     'imagem': ''
  //   },
  //   {'titulo': 'New Hair', 'subtitulo': '10 km', 'imagem': ''},
  //   {
  //     'titulo': 'Andre designer',
  //     'subtitulo': '9 km',
  //     'imagem': '',
  //   },
  //   {
  //     'titulo': 'Marcelo',
  //     'subtitulo': '1.5 km',
  //     'imagem': '',
  //   },
  //   {
  //     'titulo': 'Thais design de sobrancelhas',
  //     'subtitulo': '5.4 km',
  //     'imagem': ''
  //   },
  //   {'titulo': 'New Hair', 'subtitulo': '10 km', 'imagem': ''},
  //   {
  //     'titulo': 'Andre designer',
  //     'subtitulo': '9 km',
  //     'imagem': '',
  //   },
  //   {
  //     'titulo': 'Marcelo',
  //     'subtitulo': '1.5 km',
  //     'imagem': '',
  //   },
  //   {
  //     'titulo': 'Thais design de sobrancelhas',
  //     'subtitulo': '5.4 km',
  //     'imagem': ''
  //   },
  //   {'titulo': 'New Hair', 'subtitulo': '10 km', 'imagem': ''},
  // ];
}
