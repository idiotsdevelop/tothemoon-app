import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:moon/model/test.dart';

Future<Test> createTest(String key) async {

  Map<String , dynamic> body = { 'name' : key };
  String jsonBody = json.encode(body);

  final response = await http.post(
      Uri.parse("http://127.0.0.1:5000/api/test"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonBody,
  );
  if (response.statusCode == 200) {
    return Test.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

  } else {
    throw Exception('Failed to create Test');
  }
}

class Test {
  final String key;
  Test({required this.key});

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      key: json['name']
    );
  }
}