import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get apikey {
    return dotenv.env["API_KEY"] ?? "API_KEY not found";
  }
}
