import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:accounting_pos_project/core/constants/constants.dart';
import 'package:accounting_pos_project/core/models/contact_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  Rx<List<ContactModel>> posts = Rx<List<ContactModel>>([]);
  final isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    getAllContacts();
    super.onInit();
  }

  Future getAllContacts() async {
    try {
      posts.value.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse('${baseAPI}contactapi'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body)['feeds'];
        for (var item in content) {
          posts.value.add(ContactModel.fromJson(item));
        }
      } else {
        isLoading.value = false;
        print(json.decode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  //TODO: Next Version
  Future createContact({
    required String content,
  }) async {
    try {
      var data = {
        'content': content,
      };

      var response = await http.post(
        Uri.parse('${url}feed/store'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
        body: data,
      );

      if (response.statusCode == 201) {
        print(json.decode(response.body));
      } else {
        Get.snackbar(
          'Error',
          json.decode(response.body)['message'],
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }


    try {
      isLoading.value = true;
      var request = await http.post(
        Uri.parse('${url}feed/like/$id'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );
      if (request.statusCode == 200 ||
          json.decode(request.body)['message'] == 'liked') {
        isLoading.value = false;
        print(json.decode(request.body));
      } else if (request.statusCode == 200 ||
          json.decode(request.body)['message'] == 'Unliked') {
        isLoading.value = false;
        print(json.decode(request.body));
      } else {
        isLoading.value = false;
        print(json.decode(request.body));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}