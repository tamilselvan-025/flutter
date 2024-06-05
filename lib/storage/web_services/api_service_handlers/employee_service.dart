import 'package:flutter/cupertino.dart';
import 'package:flutter_basics/storage/web_services/model_classes/employee.dart';
import 'package:flutter_basics/storage/web_services/url_paths/employee_urls.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeService {
  //private constructor
  EmployeeService._();
  static Future<List<Employee>?> getEmployees() async {
    try {
      var url = Uri.https(EmployeeURL.baseUrl, EmployeeURL.getEmployees);
      final response = await http.get(url);
      debugPrint('++++++++++++response.contentLength :${response.contentLength}++++++++++++');
      debugPrint('++++++++++++response.isRedirect :${response.isRedirect}++++++++++++');
      debugPrint('++++++++++++response.persistentConnection :${response.persistentConnection}++++++++++++');
      debugPrint('++++++++++++response.reasonPhrase :${response.reasonPhrase}++++++++++++');
      debugPrint('++++++++++++response.request :${response.request}++++++++++++');

      if (response.statusCode == 200) {
        //status = success
        debugPrint("--------------------------------------");
        final jsonObject = json.decode(response.body);
        debugPrint("----------Status : ${jsonObject['status']}----------");
        debugPrint("----------Message : ${jsonObject['message']}----------");
        List? employees = jsonObject['data'];

        if (employees != null) {
          List<Employee> employeeList = [];
          for (var employee in employees) {
            employeeList.add(Employee.fromJson(employee));
          }
          return employeeList;
        }
       } else {
        // Request failed with an error status code
        debugPrint('----------Request failed with status: ${response.statusCode}----------');
      }
    } catch (error) {
      debugPrint("----------ERROR! : ${error.toString()}----------");
    }
    return null;
  }

  static Future<Employee?> getEmployee(int employeeId) async {
    try {
      var url = Uri.https(EmployeeURL.baseUrl, '${EmployeeURL.getEmployee}$employeeId');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        //status = success
        final Map<String, String> headers = response.headers;
        debugPrint("------------headers--------------------");
        headers.forEach((key, value) {
          debugPrint("Key : $key, value :$value");
        });

        debugPrint("--------------------------------------");
        final jsonObject = json.decode(response.body);
        debugPrint("----------Status : ${jsonObject['status']}----------");
        debugPrint("----------Message : ${jsonObject['message']}----------");
        Employee employee = Employee.fromJson(jsonObject['data']);
        debugPrint("----------${employee.toString()}----------");
        return employee;
      } else {
        // Request failed with an error status code
        debugPrint('----------Request failed with status: ${response.statusCode}----------');
      }
    } catch (error) {
      debugPrint("----------ERROR! : ${error.toString()}----------");
    }
    return null;
  }

  static Future<int> postEmployee(Employee employee) async {
    // Define the endpoint URL
    var url = Uri.https(EmployeeURL.baseUrl, EmployeeURL.createEmployee);
    // Encode the data as JSON
    var body = json.encode(employee);
    int responseStatusCode = 0;
    try {
      // Make the POST request
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        //headers provide metadata about the HTTP request or response, such as the content type, authorization token, user-agent, etc.
        body: body,
      );
      responseStatusCode = response.statusCode;
      // Check the response status code
      if (responseStatusCode == 200) {
        // Request successful, handle the response data
        debugPrint('----------Response: ${response.body}----------');
      } else {
        // Request failed with an error status code
        debugPrint('----------Request failed with status: ${response.statusCode}----------');
      }
    } catch (error) {
      // Request failed due to an error, handle the exception
      debugPrint('----------Request failed with error: $error----------');
    }
    return responseStatusCode;
  }

  static Future<int> deleteEmployee(int employeeId) async {
    // Define the endpoint URL
    var url = Uri.https(EmployeeURL.baseUrl, "${EmployeeURL.deleteEmployee}$employeeId");
    int responseStatusCode = 0;
    try {
      // Make the POST request
      var response = await http.delete(
        url,
        headers: {'Content-Type': 'application/json'},
        //headers provide metadata about the HTTP request or response, such as the content type, authorization token, user-agent, etc.
      );
      responseStatusCode = response.statusCode;
      // Check the response status code
      if (responseStatusCode == 200) {
        // Request successful, handle the response data
        debugPrint('----------Response: ${response.body}----------');
      } else {
        // Request failed with an error status code
        debugPrint('----------Request failed with status: ${response.statusCode}----------');
      }
    } catch (error) {
      // Request failed due to an error, handle the exception
      debugPrint('----------Request failed with error: $error----------');
    }
    return responseStatusCode;
  }

  static Future<int> putEmployee(Employee employee, int employeeId) async {
    // Define the endpoint URL
    var url = Uri.https(EmployeeURL.baseUrl, "${EmployeeURL.updateEmployee}$employeeId");
    // Encode the data as JSON
    var body = json.encode(employee);
    int responseStatusCode = 0;
    try {
      // Make the POST request
      var response = await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        //headers provide metadata about the HTTP request or response, such as the content type, authorization token, user-agent, etc.
        body: body,
      );
      responseStatusCode = response.statusCode;
      // Check the response status code
      if (responseStatusCode == 200) {
        // Request successful, handle the response data
        debugPrint('----------Response: ${response.body}----------');
      } else {
        // Request failed with an error status code
        debugPrint('----------Request failed with status: ${response.statusCode}----------');
      }
    } catch (error) {
      // Request failed due to an error, handle the exception
      debugPrint('----------Request failed with error: $error----------');
    }
    return responseStatusCode;
  }
  static Future<int> performHeadRequest() async {
    final url = Uri.https(EmployeeURL.baseUrl,"${EmployeeURL.getEmployee}2");
    int responseStatusCode = 0;
    try {
      final response = await http.head(url);
      responseStatusCode = response.statusCode;
      if (responseStatusCode == 200) {
        debugPrint('-----------Headers:-----------');
        response.headers.forEach((key, value) {
          debugPrint('||||||||||||$key: $value||||||||||||');
        });
      } else {
        debugPrint('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return responseStatusCode;
  }
  static Future<String> performReadRequest() async {
    final url = Uri.https(EmployeeURL.baseUrl,EmployeeURL.getEmployees);
    try {
      final response = await http.read(url);
      debugPrint('Response body: $response');
      return response;
    } catch (error) {
      debugPrint('Error: $error');
    }
    return 'ERROR in response';
  }
}


