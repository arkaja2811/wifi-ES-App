import 'package:wifies/utils/strings.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestsToServer {
  static var client = http.Client();
  //Login request

  static Future<String> login_request(List<String> arguments) async {
    try {
      var response = await client.post(
          Uri.http('192.168.231.155:8000', '/login'),
          body: {'username': Str.name, 'password': Str.pswd});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      print(decodedResponse);
      var msg = decodedResponse['msg'] as String;
      return msg;
    } finally {
      client.close();
    }
  }

  static Future<String> register_request(List<String> arguments) async {
    try {
      var response = await client.post(
          Uri.http('192.168.231.155:8000', '/register'),
          body: {'username': Str.name, 'password': Str.pswd});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var msg = decodedResponse['msg'] as String;
      //print(await client.get(msg));
      return msg;
    } finally {
      client.close();
    }
  }

  static Future<String> add_device_request(List<String> arguments) async {
    try {
      var response = await client.post(
          Uri.http('192.168.231.155:8000', '/add_device'),
          body: {'device_uuid': Str.uuid, 'device_name': Str.deviceName});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var msg = decodedResponse['msg'] as String;
      //print(await client.get(msg));
      return msg;
    } finally {
      client.close();
    }
  }

  static Future<List<String>> add_wifi_deets_request(
      List<String> arguments) async {
    try {
      var response = await client.post(
          Uri.http('192.168.231.155:8000', '/add_wifi_deets'),
          body: {'ssid': Str.wifiId, 'password': Str.wifiPswd});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var msg = decodedResponse['msg'] as String;
      var uuid = decodedResponse['uuid'] as String;
      // print(await client.get(msg));
      // print(await client.get(uuid));
      return [msg, uuid];
    } finally {
      client.close();
    }
  }

  static Future<List<String>> get_wifi_ect_for_app_request(
      List<String> arguments) async {
    try {
      var response = await client.post(
          Uri.http('192.168.231.155:8000', '/get_wifi_ect_for_app'),
          body: {'username': Str.wifiId});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var msg = decodedResponse['wifi'];
      var ect = (msg['ect'] as String);
      ;
      var krack = (msg['krack'] as String);
      var password = (msg['password'] as String);
      var ssid = (msg['ssid'] as String);
      var user_id = (msg['user_id'] as String);
      var uuid = (msg['uuid'] as String);

      // print(await client.get(ect));
      // print(await client.get(krack));
      // print(await client.get(password));
      // print(await client.get(ssid));
      // print(await client.get(user_id));
      // print(await client.get(uuid));

      return [ect, krack, password, ssid, user_id, uuid];
    } finally {
      client.close();
    }
  }
}
