// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:vitrinebeauty/model/horarios_disponiveis.dart';
import 'package:vitrinebeauty/model/model_card_agenda.dart';
import 'package:vitrinebeauty/model/servico.dart';
import 'package:vitrinebeauty/utils/hexColor.dart';
import 'package:vitrinebeauty/widgets/widgets_agenda/card_agenda.dart';

class Agendamento extends StatefulWidget {
  final List<Servico> servicos;
  final double valorTotal;
  final String? nome;
  final String? endereco;
  const Agendamento(this.servicos, this.valorTotal, this.nome, this.endereco,
      {Key? key})
      : super(key: key);

  @override
  _AgendamentoState createState() => _AgendamentoState();
}

class _AgendamentoState extends State<Agendamento> {
  DateTime? _dataSelecionada;

  int _currentStep = 0;
  int? chaveSelecionada;
  //List<Map<int,String>> horarios=[];
  HorariosDisponiveis? conjHorario;
  @override
  void initState() {
    conjHorario = HorariosDisponiveis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double larguraIcone = largura * 0.5;
    double altura = MediaQuery.of(context).size.height;
    double alturaPadding = altura * 0.4;
    double alturaIcone = altura * 0.1;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: larguraIcone * 0.2),
        child: Container(
          child: Column(
            children: [
              _botaoRetornar(alturaPadding, largura),
              _botaoData(largura, alturaIcone),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dataPreenchida(double largura, double alturaIcone) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: largura * 0.1),
            child: Text(
              '${_dataSelecionada!.day}/${_dataSelecionada!.month}/${_dataSelecionada!.year}',
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
            ),
          ),
          _botaoData(largura, alturaIcone)
        ],
      ),
    );
  }

  Widget _botaoTime(double largura, double alturaIcone) {
    return ElevatedButton(
      onPressed: () {
        showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        ).then((time) {
          setState(() {});
        });
      },
      style: ElevatedButton.styleFrom(
        onPrimary: HexColor('#ffffff'),
        primary: HexColor('#1818ff').withOpacity(0.9),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(29)),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        width: largura * 0.4,
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: alturaIcone * 0.1),
              child: Icon(Icons.perm_contact_calendar),
            ),
            const Text(
              'Selecionar data',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _botaoData(double largura, double alturaIcone) {
    return ElevatedButton(
      onPressed: () {
        showDatePicker(
          context: context,
          initialDate: _dataSelecionada ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2030),
        ).then((data) {
          setState(() {
            _dataSelecionada = data;
          });
        });
      },
      style: ElevatedButton.styleFrom(
        onPrimary: HexColor('#ffffff'),
        primary: HexColor('#1818ff').withOpacity(0.9),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(29)),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        width: largura * 0.4,
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: alturaIcone * 0.1),
              child: Icon(Icons.perm_contact_calendar),
            ),
            const Text(
              'Selecionar data',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _botaoRetornar(double alturaPadding, double largura) {
    return Padding(
      padding: EdgeInsets.only(
        left: largura * 0.04,
        right: largura * 0.04,
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
    );
  }
}

//  List<Step> _mySteps(
//       double largura, double alturaIcone, double alturaPadding) {
//     List<Step> _steps = [
//       Step(
//         title: Text('Data'),
//         content: _dataSelecionada != null
//             ? _dataPreenchida(largura, alturaIcone)
//             : _botaoData(largura, alturaIcone),
//         isActive: _currentStep >= 0,
//       ),
//       Step(
//         title: Text('Horário'),
//         content: _agendarHorario(largura, alturaIcone),
//         isActive: _currentStep >= 1,
//       ),
//       Step(
//         title: Text('Confirmação'),
//         content: _telaConfirmacao(largura, alturaIcone, alturaPadding),
//         isActive: _currentStep >= 2,
//       )
//     ];
//     return _steps;
//   }

// Widget _agendarHorario(double largura, double alturaIcone) {
//   return Column(
//     children: [
//       Padding(
//         padding: EdgeInsets.symmetric(vertical: largura * 0.01),
//         child: Container(
//           child: const Text(
//             'Escolha o horário : ',
//             style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
//           ),
//         ),
//       ),
//       Container(
//         child: ListView.builder(
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: conjHorario!.horarios.length,
//             itemBuilder: (ctx, index) {
//               var horario = conjHorario!.horarios[index];
//               return Padding(
//                 padding: EdgeInsets.symmetric(vertical: largura * 0.01),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: HexColor('#1818ff'),
//                       width: 2,
//                     ),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: RadioListTile(
//                     title: Text('${horario[index + 1]}'),
//                     value: index + 1,
//                     groupValue: chaveSelecionada,
//                     selected: chaveSelecionada == index + 1 ? true : false,
//                     onChanged: (value) {
//                       setState(() {
//                         chaveSelecionada = value as int?;
//                         // conjHorario!.atualizarHorarioSelecionado();
//                       });
//                     },
//                   ),
//                 ),
//               );
//             }),
//       ),
//     ],
//   );
// }

// final List<Servico> servicos;
//   final double valorTotal;
//   final String? nome;
//   final String? endereco;
//   const Agendamento(this.servicos, this.valorTotal, this.nome, this.endereco,
