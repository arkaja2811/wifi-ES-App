
import 'package:wifies/utils/strings.dart';


import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestsToServer{

  static var client = http.Client();
  //Login request

  void login_request(List<String> arguments) async {
    try {
      var response = await client.post(
          Uri.https('0.0.0.0:8000', '/login'),
          body: {'username': Str.name, 'password': Str.pswd});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var msg = Uri.parse(decodedResponse['msg'] as String);
      print(await client.get(msg));
    } finally {
      client.close();
    }
  }

  void register_request(List<String> arguments) async {
    try {
      var response = await client.post(
          Uri.https('0.0.0.0:8000', '/register'),
          body: {'username': Str.name, 'password': Str.pswd});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var msg = Uri.parse(decodedResponse['msg'] as String);
      print(await client.get(msg));
    } finally {
      client.close();
    }
  }

  void add_device_request(List<String> arguments) async {
    try {
      var response = await client.post(
          Uri.https('0.0.0.0:8000', '/add_device'),
          body: {'device_uuid': Str.uuid, 'device_name': Str.deviceName});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var msg = Uri.parse(decodedResponse['msg'] as String);
      print(await client.get(msg));
    } finally {
      client.close();
    }
  }

  void add_wifi_deets_request(List<String> arguments) async {
    try {
      var response = await client.post(
          Uri.https('0.0.0.0:8000', '/add_wifi_deets'),
          body: {'ssid': Str.wifiId, 'password': Str.wifiPswd});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var msg = Uri.parse(decodedResponse['msg'] as String);
      var uuid = Uri.parse(decodedResponse['uuid'] as String);
      print(await client.get(msg));
      print(await client.get(uuid));
    } finally {
      client.close();
    }
  }

  void get_wifi_ect_for_app_request(List<String> arguments) async {
    try {
      var response = await client.post(
          Uri.https('0.0.0.0:8000', '/get_wifi_ect_for_app'),
          body: {'username': Str.wifiId});
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var msg = decodedResponse['wifi'];
      var ect=Uri.parse(msg['ect'] as String);;
      var krack=Uri.parse(msg['krack'] as String);
      var password= Uri.parse(msg['password'] as String);
      var ssid=Uri.parse(msg['ssid'] as String);
      var user_id=Uri.parse(msg['user_id'] as String);
      var uuid=Uri.parse(msg['uuid'] as String);
    
      print(await client.get(ect));
      print(await client.get(krack));
      print(await client.get(password));
      print(await client.get(ssid));
      print(await client.get(user_id));
      print(await client.get(uuid));
    } finally {
      client.close();
    }
  }

}