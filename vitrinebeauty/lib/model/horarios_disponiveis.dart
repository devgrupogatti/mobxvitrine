class HorariosDisponiveis {
  Map<int, String>? horarioSecionado;
  int? chaveSelecionada;
  List<Map<int, String>> horarios = [
    {1: '09:00'},
    {2: '10:00'},
    {3: '11:00'},
    {4: '12:00'},
    {5: '13:00'},
    {6: '14:00'},
    {7: '15:00'},
    {8: '16:00'},
    {9: '17:00'},
  ];

  void atualizarHorarioSelecionado() {
    horarioSecionado =
        horarios.singleWhere((element) => element.keys == chaveSelecionada);
  }
}
