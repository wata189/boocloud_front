import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'ENV')
  static const String env = _Env.env;

  @EnviedField(varName: 'APP_URL')
  static const String appUrl = _Env.appUrl;

  @EnviedField(varName: 'BACKEND_URL')
  static const String backendUrl = _Env.backendUrl;

  @EnviedField(varName: 'OPEN_BD_COVER_URL')
  static const String openBdCoverUrl = _Env.openBdCoverUrl;

  @EnviedField(varName: 'OPEN_BD_URL')
  static const String openBdUrl = _Env.openBdUrl;

  @EnviedField(varName: 'NDL_SEARCH_URL')
  static const String ndlSearchUrl = _Env.ndlSearchUrl;

  @EnviedField(varName: 'FIREBASE_API_KEY', obfuscate: true)
  static final String firebaseApiKey = _Env.firebaseApiKey;

  @EnviedField(varName: 'FIREBASE_AUTH_DOMAIN')
  static const String firebaseAuthDomain = _Env.firebaseAuthDomain;

  @EnviedField(varName: 'GOOGLE_BOOKS_API_KEY', obfuscate: true)
  static final String googleBooksApiKey = _Env.googleBooksApiKey;

  @EnviedField(varName: 'GOOGLE_BOOKS_URL')
  static const String googleBooksUrl = _Env.googleBooksUrl;
}