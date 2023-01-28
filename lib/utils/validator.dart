import 'dart:async';

const String _kEmailRule = r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
const String _kPasswordRule =
    r'^(?=.*[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

class EmptyVaildator {
  StreamTransformer<String, String> vaildateEmpty(String content) {
    return StreamTransformer.fromHandlers(handleData: (text, sink) {
      if (text.isEmpty) {
        sink.addError("$content 입력해주세요");
      } else {
        sink.add(text);
      }
    });
  }
}

class EmailVaildator {
  final StreamTransformer<String, String> vaildateEmail =
      StreamTransformer.fromHandlers(handleData: (email, sink) {
    final RegExp emailExp = RegExp(_kEmailRule);

    if (email.isEmpty) {
      sink.addError("이메일을 입력해주세요");
    } else if (!emailExp.hasMatch(email)) {
      sink.addError("이메일 형식을 지켜주세요");
    } else {
      sink.add(email);
    }
  });
}

class PasswordVaildator {
  final StreamTransformer<String, String> vaildatePassword =
      StreamTransformer.fromHandlers(handleData: (password, sink) {
    final RegExp passwordExp = RegExp(_kPasswordRule);

    if (password.isEmpty) {
      sink.addError("비밀번호를 입력해주세요");
    } else if (!passwordExp.hasMatch(password)) {
      sink.addError("8글자 이상, 특수문자 포함");
    } else {
      sink.add(password);
    }
  });
}
