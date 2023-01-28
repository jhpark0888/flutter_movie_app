import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/bloc/signup_form_bloc.dart';
import 'package:flutter_bloc_movies/ui/components/appbar.dart';
import 'package:flutter_bloc_movies/ui/components/button.dart';
import 'package:flutter_bloc_movies/ui/components/textfield.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SignupFormBloc _signupFormBloc = SignupFormBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    _signupFormBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: "회원가입",
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 100),
                _textFields(),
                _buttons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFields() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Column(
        children: [
          StreamBuilder<String>(
            stream: _signupFormBloc.name,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return CustomTextField(
                label: "이름",
                hintText: "이름을 입력해주세요",
                errorText: snapshot.error as String?,
                onChanged: _signupFormBloc.onNameChanged,
              );
            },
          ),
          const SizedBox(height: 10),
          StreamBuilder<String>(
            stream: _signupFormBloc.email,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return CustomTextField(
                label: "이메일",
                hintText: "이메일을 입력해주세요",
                errorText: snapshot.error as String?,
                keyboardType: TextInputType.emailAddress,
                onChanged: _signupFormBloc.onEmailChanged,
              );
            },
          ),
          const SizedBox(height: 10),
          StreamBuilder<String>(
            stream: _signupFormBloc.password,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return CustomTextField(
                label: "비밀번호",
                hintText: "비밀번호를 입력해주세요",
                errorText: snapshot.error as String?,
                onChanged: _signupFormBloc.onPasswordChanged,
                obscureText: true,
              );
            },
          ),
          const SizedBox(height: 10),
          StreamBuilder<String>(
            stream: _signupFormBloc.checkPassword,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return CustomTextField(
                label: "비밀번호 확인",
                hintText: "비밀번호를 한번 더 입력해주세요",
                errorText: snapshot.error as String?,
                onChanged: _signupFormBloc.onCheckPasswordChanged,
                obscureText: true,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buttons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Column(
        children: [
          StreamBuilder<bool>(
            stream: _signupFormBloc.signupVaild,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              return MainButton(
                  text: "회원가입",
                  onPressed: (snapshot.hasData && snapshot.data == true)
                      ? () {
                          Navigator.pop(context);
                        }
                      : null);
            },
          ),
        ],
      ),
    );
  }
}
