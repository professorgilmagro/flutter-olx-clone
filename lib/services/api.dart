import 'package:parse_server_sdk/parse_server_sdk.dart';

class Api {
  static final _instance = Api._internal();
  static const APP_ID = 'ZBNRfG7VXcTJ5CyjU490SG8e6jytYgZCOBidONJb';
  static const CLIENT_KEY = 'UuUIFjpyTmFCc9Ojml7Cade6EYot5a9St260jkoL';
  static const BASE_URL = 'https://parseapi.back4app.com/';
  Parse _server;

  static Api get instance {
    return _instance;
  }

  Api._internal() {}

  Future<Parse> initServer() async {
    if (_server == null) {
      _server = await _getParseService();
    }

    return _server;
  }

  Future<Parse> _getParseService() {
    return Parse().initialize(
      APP_ID,
      BASE_URL,
      clientKey: CLIENT_KEY,
      autoSendSessionId: true,
      debug: true,
    );
  }
}
