import 'package:assignment/config/theme/colors.dart';
import 'package:assignment/core/widgets/loading.dart';
import 'package:assignment/user_interface/controller/game_details_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameDetailsPage extends StatelessWidget {
  int? getid;
  GameDetailsPage({Key? key, required this.getid, e}) : super(key: key);

  final GameDetailsController gameDetailsCtrl =
      Get.put(GameDetailsController());

  Widget build(BuildContext context) {
    gameDetailsCtrl.fetchGameDetails(getid!);
    return Obx(() => Scaffold(
        body: !gameDetailsCtrl.isLoading.value
            ? const LoadingWidget(transition: Transition.leftToRight)
            : CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  SliverAppBar(
                    backgroundColor: AppColors.teal,
                    pinned: true,
                    title: Text(gameDetailsCtrl.gameDetails.value!.name!),
                    expandedHeight: 260.0,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(children: [
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          imageUrl: gameDetailsCtrl.gameDetails.value!
                                  .backgroundImageAdditional ??
                              '',
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 120,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                  AppColors.darkGrey,
                                  Colors.transparent
                                ])),
                          ),
                        ),
                      ]),
                      collapseMode: CollapseMode.parallax,
                    ),
                  ),
                  SliverFillRemaining(
                    child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 60,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 0, left: 5, bottom: 5),
                                      child: Text(
                                        'Genres',
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Expanded(
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: gameDetailsCtrl
                                                .gameDetails
                                                .value!
                                                .genres!
                                                .length,
                                            itemBuilder: (context, index) {
                                              final genre = gameDetailsCtrl
                                                  .gameDetails
                                                  .value!
                                                  .genres?[index];
                                              return Container(
                                                margin: const EdgeInsets.all(2),
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: AppColors.teal),
                                                child: Center(
                                                    child: Text(
                                                  genre?.name ?? '',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                              );
                                            })),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.only(top: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Description',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.black,
                                          fontSize: 16),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      gameDetailsCtrl
                                          .gameDetails.value!.descriptionRaw!,
                                      style: const TextStyle(
                                          color: AppColors.black),
                                      textAlign: TextAlign.justify,
                                      maxLines: 9,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 100,
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 8),
                                margin: const EdgeInsets.only(top: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Platforms',
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: gameDetailsCtrl.gameDetails
                                            .value!.platforms?.length,
                                        itemBuilder: (context, index) {
                                          final platform = gameDetailsCtrl
                                              .gameDetails
                                              .value!
                                              .platforms![index];
                                          return Container(
                                            height: 50,
                                            width: 50,
                                            margin: const EdgeInsets.all(5),
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                if (platform.platform!.name!
                                                    .contains('PC'))
                                                  Image.asset(
                                                    'assets/icons/windows_logo.png',
                                                    height: 25,
                                                    width: 25,
                                                    color: Colors.black,
                                                  ),
                                                if (platform.platform!.name!
                                                    .contains('PlayStation'))
                                                  Image.asset(
                                                      'assets/icons/ps_logo.png',
                                                      height: 25,
                                                      width: 25,
                                                      color: Colors.black),
                                                if (platform.platform!.name!
                                                    .contains('Xbox'))
                                                  Image.asset(
                                                    'assets/icons/xbox_logo.png',
                                                    height: 25,
                                                    width: 25,
                                                    color: Colors.black,
                                                  ),
                                                if (platform.platform!.name!
                                                    .contains('Wii'))
                                                  Image.asset(
                                                    'assets/icons/wii_logo.png',
                                                    height: 25,
                                                    width: 25,
                                                    color: Colors.black,
                                                  ),
                                                if (platform.platform!.name!
                                                        .contains('iOS') ||
                                                    platform.platform!.name!
                                                        .contains('iPhone') ||
                                                    platform.platform!.name!
                                                        .contains('iPad'))
                                                  Image.asset(
                                                    'assets/icons/apple_logo.png',
                                                    height: 25,
                                                    width: 25,
                                                    color: Colors.black,
                                                  ),
                                                if (platform.platform!.name!
                                                    .contains('Android'))
                                                  Image.asset(
                                                    'assets/icons/android_logo.png',
                                                    height: 25,
                                                    width: 25,
                                                    color: Colors.black,
                                                  ),
                                                if (platform.platform!.name!
                                                        .contains('macOs') ||
                                                    platform.platform!.name!
                                                        .contains('Macintosh'))
                                                  Image.asset(
                                                    'assets/icons/mac.png',
                                                    height: 25,
                                                    width: 25,
                                                    color: Colors.black,
                                                  ),
                                                if (platform.platform!.name!
                                                    .contains('Linux'))
                                                  Image.asset(
                                                    'assets/icons/linux_logo.png',
                                                    height: 25,
                                                    width: 25,
                                                    color: Colors.black,
                                                  ),
                                                if (platform.platform!.name!
                                                    .contains('PS'))
                                                  Image.asset(
                                                    'assets/icons/ps_vista.png',
                                                    height: 25,
                                                    width: 25,
                                                    color: Colors.black,
                                                  ),
                                                if (platform.platform!.name!
                                                    .contains('Nintendo'))
                                                  Image.asset(
                                                    'assets/icons/gamepad.png',
                                                    height: 25,
                                                    width: 25,
                                                    color: Colors.black,
                                                  )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 200,
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.only(top: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 5, left: 5),
                                      child: Text(
                                        'Screenshots',
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 5),
                                        child: Container(
                                          // padding: EdgeInsets.symmetric(
                                          //     horizontal: 16.0, vertical: 24.0),
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics: BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              itemCount: gameDetailsCtrl
                                                  .gameDetails
                                                  .value!
                                                  .platforms!
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return Card(
                                                  child: Image.network(
                                                    gameDetailsCtrl
                                                        .gameDetails
                                                        .value!
                                                        .platforms![index]
                                                        .platform!
                                                        .imageBackground!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]),
                  )
                ],
              )));
  }
}
