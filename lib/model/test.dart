import 'package:flutter/material.dart';

class Test {
  final String name;
  final int phoneNumber;

  // int? temp;

  Test({required this.name, required this.phoneNumber});

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      name: json['name'],
      phoneNumber: json['phone_number'],
    );
  }
}
