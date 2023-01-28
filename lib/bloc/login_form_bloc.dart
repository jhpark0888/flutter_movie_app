import 'package:flutter_bloc_movies/bloc/bloc_helpers/bloc_provider.dart';
import 'package:flutter_bloc_movies/utils/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginFormBloc extends Object
    with EmailVaildator, PasswordVaildator
    implements BlocBase {
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();

  Function(String) get onEmailChanged => _emailController.sink.add;
  Function(String) get onPasswordChanged => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(vaildateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(vaildatePassword);

  Stream<bool> get loginVaild =>
      CombineLatestStream([email, password], <String>([e, p]) => true);

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.close();
    _passwordController.close();
  }
}
