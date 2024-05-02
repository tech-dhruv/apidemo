import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';
import '../model/multi_data_model.dart';
import '../model/update_model.dart';

class ApiServices {
  Future<MultiData?> getMultiDataWithModel() async {
    try {
      var response = await http.get(Uri.parse('https://reqres.in/api/unknown'));

      if (response.statusCode == 200) {
        MultiData model = MultiData.fromJson(json.decode(response.body));
        return model;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }

  Future<CreateJobModel?> createJob(String name, String job) async {
    try {
      var url = Uri.parse("https://reqres.in/api/users");

      var response = await http.post(url, body: {"name": name, "job": job});
      print("response --> ${response.statusCode}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        CreateJobModel model =
            CreateJobModel.fromJson(jsonDecode(response.body));
        return model;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<UpdateData?> updateData(String name, String job) async {
    try {
      Map<String, dynamic> request = {"name": name, "job": job};
      var url = Uri.parse("https://reqres.in/api/users/2");
      var response = await http.put(url,body: request);
      print("response --> ${response.statusCode}");

      if (response.statusCode == 201 || response.statusCode == 200) {
        UpdateData model = UpdateData.fromJson(jsonDecode(response.body));
        return model;
      }

    } catch (e) {
      print(e);
    }
    return null;
  }
}
