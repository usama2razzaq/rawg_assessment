import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  TextEditingController controller = new TextEditingController();
  RxString searchQuery = RxString('');

  void setSearchQuery(String query) {
    searchQuery.value = query;
  }
}
