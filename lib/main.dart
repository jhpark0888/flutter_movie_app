import 'package:flutter/material.dart';
import 'package:flutter_bloc_movies/ui/init_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'styles/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyThemes.darkTheme,
      home: const InitPage(),
    );
  }
}
