import 'package:assignment/networks/API/repository.dart';
import 'package:assignment/networks/data_model/games_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

class GameController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool loadPage = false.obs;
  RxBool isNextPage = false.obs, allowNextPage = true.obs;
  RxInt page = 1.obs, perPage = 20.obs;
  Repository? repository;
  GamesResponse? gameList;
  RxList<Result>? savedGameList = <Result>[].obs;
  final currentDate = DateTime.now();
  DateTime? endDate;
  DateTime? startDate;
  final dateFormat = DateFormat('yyyy-MM-dd');

  Rx<ScrollController> scrollController = ScrollController().obs;

  @override
  void onInit() {
    repository = Repository();
    endDate = currentDate;
    startDate =
        DateTime(currentDate.year - 1, currentDate.month, currentDate.day);
    scrollController.value.addListener(scrollListener);
    fetchGameList();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.value.dispose();

    super.dispose();
  }

  scrollListener() {
    if (scrollController.value.offset <=
            scrollController.value.position.minScrollExtent &&
        !scrollController.value.position.outOfRange) {
      print("load top");
    }

    if (scrollController.value.offset >=
            scrollController.value.position.maxScrollExtent &&
        !scrollController.value.position.outOfRange) {
      print("load bottom");
      nextPage();
    }
  }

  void nextPage() {
    if (!allowNextPage.value) return;

    page = page + 1;
    isNextPage.value = true;
    print(page.value);
    isLoading.value = false;
    fetchGameList();
  }

  fetchGameList() async {
    try {
      gameList = await repository!.getGames(
          page: page.value,
          pageSize: perPage.value,
          startDate: dateFormat.format(startDate!).toString(),
          endDate: dateFormat.format(endDate!).toString());

      int untilIndex = (page.value * perPage.value);

      if ((page.value * perPage.value) > gameList!.count!) {
        untilIndex = gameList!.count! -
            (((page.value * perPage.value) - gameList!.count!));
        allowNextPage.value = false;
        isLoading.value = true;
      } else {
        savedGameList!.addAll(gameList!.results!);

        isNextPage.value = false;
        isLoading.value = true;
      }
    } catch (e) {
      print(e);

      Get.back(closeOverlays: true);
    }
  }
}
