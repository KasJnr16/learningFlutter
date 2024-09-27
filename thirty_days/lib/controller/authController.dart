import 'dart:convert';
import 'package:thirty_days/models/user.dart';
import 'package:http/http.dart' as http;

Future<void> createAccount(User user) async {
  String url = "http://192.168.137.101:9090/campusstore/auth/register/";

  try {
    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(user.toJson()), // Proper JSON encoding
    );

    if (response.statusCode == 200) {
      print("////////////////Success///////////////");
    } else {
      print("Failed with status code: ${response.statusCode}");
      print("Response: ${response.body}");
    }
  } on Exception catch (e) {
    print("Exception: $e");
  } catch (e) {
    print("Error: $e");
  }
}

Future<void> login(User user) async {
  String url = "http://192.168.137.101:9090/campusstore/auth/authenticate/";

  Map<String, dynamic> body = {
    'username': user.email,
    'phone': user.email,
    'email': user.email,
    'password': user.password,
  };

  print(jsonEncode(body));
  try {
    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body), // Proper JSON encoding
    );

    if (response.statusCode == 200) {
      print("////////////////Success///////////////");
    } else {
      print("Failed with status code: ${response.statusCode}");
      print("Response: ${response.body}");
    }
  } on Exception catch (e) {
    print("Exception: $e");
  } catch (e) {
    print("Error: $e");
  }
}
