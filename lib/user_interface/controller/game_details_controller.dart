import 'package:assignment/networks/API/repository.dart';
import 'package:assignment/networks/data_model/game_details_response.dart';
import 'package:get/get.dart';

class GameDetailsController extends GetxController {
  RxBool isLoading = false.obs;

  RxInt id = 0.obs;
  Repository? repository;
  Rxn<GameDetailsResponse> gameDetails = Rxn<GameDetailsResponse>();

  @override
  void onInit() {
    repository = Repository();

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

//Fetch Data from Api
  fetchGameDetails(int id) async {
    try {
      gameDetails.value = await repository!.getGameDetails(id: id);

      isLoading.value = true;
    } catch (e) {
      print(e);

      Get.back(closeOverlays: true);
    }
  }
}
