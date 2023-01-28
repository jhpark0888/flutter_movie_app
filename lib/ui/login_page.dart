import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/bloc/login_form_bloc.dart';
import 'package:flutter_bloc_movies/ui/components/button.dart';
import 'package:flutter_bloc_movies/ui/components/textfield.dart';
import 'package:flutter_bloc_movies/ui/movie_page.dart';
import 'package:flutter_bloc_movies/ui/signup_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginFormBloc _loginFormBloc = LoginFormBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    _loginFormBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _appIcon(),
                const SizedBox(height: 60),
                _textFields(),
                _buttons(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appIcon() {
    return SvgPicture.asset("assets/icons/app_icon.svg");
  }

  Widget _textFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Column(
        children: [
          StreamBuilder<String>(
            stream: _loginFormBloc.email,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return CustomTextField(
                label: "이메일",
                hintText: "이메일을 입력해주세요",
                errorText: snapshot.error as String?,
                keyboardType: TextInputType.emailAddress,
                onChanged: _loginFormBloc.onEmailChanged,
              );
            },
          ),
          const SizedBox(height: 10),
          StreamBuilder<String>(
            stream: _loginFormBloc.password,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return CustomTextField(
                label: "비밀번호",
                hintText: "비밀번호를 입력해주세요",
                errorText: snapshot.error as String?,
                onChanged: _loginFormBloc.onPasswordChanged,
                obscureText: true,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buttons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Column(
        children: [
          StreamBuilder<bool>(
            stream: _loginFormBloc.loginVaild,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              return MainButton(
                  text: "로그인",
                  onPressed: (snapshot.hasData && snapshot.data == true)
                      ? () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const MovieHomePage()));
                        }
                      : null);
            },
          ),
          const SizedBox(height: 10),
          CustomOutlineButton(
              text: "회원가입",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupPage()));
              }),
        ],
      ),
    );
  }
}
