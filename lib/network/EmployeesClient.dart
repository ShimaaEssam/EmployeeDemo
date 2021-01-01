import 'dart:convert';

import 'package:flutter_rest_api/model/Employee.dart';
import 'package:http/http.dart' as http;
class EmployeesClient {
//
  final String BaseURL = "http://dummy.restapiexample.com/api/v1";

  Future<Employee> getEmployee() async {
    final String url = "/employees";
    final response = await http.get(BaseURL + url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return Employee.fromJson(json);
    }
    else {
      print("Error");
    }
  }


  Future<bool> addEmployee(dynamic body) async {
    final String url = "/create";
    final respnse = await http.post(BaseURL + url, body: body);
    if (respnse.statusCode == 200) {
      return true;
    }
    else
      return false;
  }
}