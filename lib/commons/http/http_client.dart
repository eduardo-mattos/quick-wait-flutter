import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  final API_URL = "https://quick-wait/api/v1";
  final API_METHOD_GET = "GET";
  final API_METHOD_POST = "POST";

  Future login(String? username, String? password) async {
    var map = new Map<String, dynamic>();
    map['username'] = '$username';
    map['password'] = '$password';

    final response = await http.post(Uri.parse("$API_URL/login"), body: map);
    return json.decode(response.body);
  }

  Future curl(String route, String method, {body}) async {
    var token = await getToken();
    Uri routeApi = Uri.parse("$API_URL$route");

    var response;
    switch (method) {
      case 'POST':
        {
          response = await http.post(routeApi, headers:{
            'Authorization': '$token',
          } , body: body);
          break;
        }
      case 'GET':
        {
          response = await http.get(routeApi,
              headers:{
                'Authorization': '$token',
              },
          );
        }
    }
    return json.decode(response.body);
  }

  saveToken(response) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', response['data']['token_type'] + " " + response['data']['access_token']);
  }

  Future<Object?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.get('token');
  }

  static Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.get('token') != null;
  }

  static deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove('token');
  }
}
