
class Config {
  static const String webService = "";

  static const String hostIp = "";

  static String get baseUrl => "$hostIp/$webService";

}
