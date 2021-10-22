class Validacao {
  final Map<String, String> errors = {
    'nome': 'Informe um nome',
    'email_vazio': 'Informe um email',
    'email_sem_arroba': 'Insira um email válido',
    'senha_incorreta': 'Senha incorreta',
    'senhas_diferentes': 'As senhas estao diferentes',
    'telefone_vazio': 'Informe o número',
    'telefone_incompleto': 'Informe um número válido',
  };

  String retorno = '';

  String resposta(String key) {
    if (errors.containsKey(key)) {
      retorno = errors[key].toString();
      return retorno;
    } else {
      return 'Ocorreu um erro na autenticação';
    }
  }
}
