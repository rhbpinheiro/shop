class AuthExceptions implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'E-mail não cadstrado.',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida!',
    'TOO_MANY_ATTEMPTS_TRY_LATER':
        'Acesso bloqueado temporariamente. Tente mais tarde.',
    'EMAIL_NOT_FOUND': 'E-mail não encontrado.',
    'INVALID_PASSWORD': 'Senha informada não cofere.',
    'USER_DISABLED': 'Aconta do uruário foi desabilitada.',
  };
  final String key;

  AuthExceptions(this.key);

  @override
  String toString() {
    return errors[key] ?? 'Ocorreu um erro no processo de autenticação.';
  }
}
