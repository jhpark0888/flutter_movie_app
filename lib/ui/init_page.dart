import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/bloc/app_init_bloc.dart';
import 'package:flutter_bloc_movies/ui/login_page.dart';
import 'package:flutter_bloc_movies/ui/movie_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/bloc_helpers/bloc_event_state_builder.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  AppInitBloc bloc = AppInitBloc();

  @override
  void initState() {
    // TODO: implement initState
    bloc.emitEvent(AppInitEvent());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Center(
            child: BlocEventStateBuilder<AppInitEvent, AppInitState>(
              bloc: bloc,
              builder: (BuildContext context, AppInitState state) {
                if (state.isInitialized) {
                  //
                  // Once the initialization is complete, let's move to another page
                  //
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginPage()));
                  });
                }
                return SvgPicture.asset("assets/icons/app_icon.svg");
              },
            ),
          ),
        ),
      ),
    );
  }
}
