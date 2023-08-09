class auth_exception implements Exception {
  final String key;

  static const Map<String, String> Errors = {
    'EMAIL_EXISTS': 'E-mail já cadastrado',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida',
    'TOO_MANY_ATTEMPTS_TRY_LATER': 'Tente mais tarde',
    'EMAIL_NOT_FOUND': 'E-mail não encontrado',
    'INVALID_PASSWORD': 'Senha inválida',
    'USER_DISABLED': 'Usuário desabilitado',
  };

  auth_exception(this.key);

  @override
  String toString() {
    // TODO: implement toString
    return Errors[key]?? 'Ocorreu um erro na autenticação';
  }
}
