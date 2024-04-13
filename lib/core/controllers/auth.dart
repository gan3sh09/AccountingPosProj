import 'dart:convert';

import 'package:accounting_pos_project/core/constants/constants.dart';
import 'package:accounting_pos_project/ui/views/home.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class AuthenticationController extends GetxController {
  final isLoading = false.obs;
  final token = ''.obs;

  final box = GetStorage();

  Future<void> authenticate({
    required AuthType authType,
    required Map<String, String> credentials,
  }) async {
    try {
      isLoading.value = true;

      String endpoint = authType == AuthType.Register ? 'register' : 'login';
      // Need to write AuthType logic is still pending

      var response = await http.post(
        Uri.parse('${oauthURL}$endpoint'),
        headers: {'Accept': 'application/json'},
        body: credentials,
      );

      handleResponse(response);
    } catch (e) {
      handleError(e.toString());
    }
  }

  void handleResponse(http.Response response) {
    isLoading.value = false;

    if (response.statusCode == 200 || response.statusCode == 201) {
      token.value = json.decode(response.body)['token'];
      box.write('token', token.value);
      Get.offAll(() => const HomeDashboardScreen());
    } else {
      showError(json.decode(response.body)['message']);
    }
  }

  void handleError(String errorMessage) {
    isLoading.value = false;
    print(errorMessage);
    // Handle error gracefully, show a snackbar, etc.
  }

  void showError(String errorMessage) {
    Get.snackbar(
      'Error',
      errorMessage,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
    print(errorMessage);
  }




  // This is just for testing purpose 
  Future fetchData() async {
    var url = Uri.parse('https://pos.ultimatefosters.com/connector/api/product');
    var headers = {
      'Authorization': 'Bearer {access_token}',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    var queryParameters = {
      'order_by': 'molestias',
      'order_direction': 'tenetur',
      'brand_id': 'excepturi',
      'category_id': 'voluptatem',
      'sub_category_id': 'soluta',
      'location_id': '1',
      'selling_price_group': 'necessitatibus',
      'send_lot_detail': 'sit',
      'name': 'quis',
      'sku': 'consectetur',
      'per_page': '10',
    };

    var uri = Uri.https(url.authority, url.path, queryParameters);

    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      // Request successful, you can process the response here
      print('Response body: ${response.body}');
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}');
    }
  }



}