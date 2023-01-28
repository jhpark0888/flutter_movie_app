import 'package:flutter_bloc_movies/bloc/bloc_helpers/bloc_provider.dart';
import 'package:flutter_bloc_movies/utils/validator.dart';
import 'package:rxdart/rxdart.dart';

class SignupFormBloc extends Object
    with EmailVaildator, PasswordVaildator, EmptyVaildator
    implements BlocBase {
  final BehaviorSubject<String> _nameController = BehaviorSubject<String>();
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordCheckController =
      BehaviorSubject<String>();

  Function(String) get onNameChanged => _nameController.sink.add;
  Function(String) get onEmailChanged => _emailController.sink.add;
  Function(String) get onPasswordChanged => _passwordController.sink.add;
  Function(String) get onCheckPasswordChanged =>
      _passwordCheckController.sink.add;

  Stream<String> get name =>
      _nameController.stream.transform(vaildateEmpty("이름을"));
  Stream<String> get email => _emailController.stream.transform(vaildateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(vaildatePassword);
  Stream<String> get checkPassword => _passwordCheckController.stream
          .transform(vaildatePassword)
          .doOnData((String pwc) {
        if (pwc != _passwordController.value) {
          _passwordCheckController.addError("비밀번호와 일치하지 않습니다");
        }
      });

  Stream<bool> get signupVaild => CombineLatestStream(
      [name, email, password, checkPassword], <String>([n, e, p, c]) => true);

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.close();
    _emailController.close();
    _passwordController.close();
    _passwordCheckController.close();
  }
}
