enum LoginType {
  GOOGLE,
  APPLE,
  EMAIL,
}

extension LoginTypeExt on LoginType {
  static final codeTypes = {
    'GOOGLE': LoginType.GOOGLE,
    'APPLE': LoginType.APPLE,
    'EMAIL': LoginType.EMAIL
  };

  static final japaneseNames = {
    LoginType.GOOGLE: "Google",
    LoginType.APPLE: "Apple",
    LoginType.EMAIL: "メールアドレス"
  };

  static LoginType fromCode(String code) {
    return LoginTypeExt.codeTypes[code];
  }

  String get code => LoginTypeExt.codeTypes.entries
      .singleWhere((entry) => entry.value == this)
      .key;

  String get japaneseName => LoginTypeExt.japaneseNames[this];
}
