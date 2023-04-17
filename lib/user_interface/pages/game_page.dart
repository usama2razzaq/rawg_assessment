import 'package:assignment/config/theme/colors.dart';
import 'package:assignment/core/widgets/loading.dart';
import 'package:assignment/user_interface/controller/game_controller.dart';
import 'package:assignment/user_interface/pages/game_details_page.dart';
import 'package:assignment/user_interface/widgets/my_decoration.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GamesPage extends StatelessWidget {
  GamesPage({super.key});
  final GameController getGames = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.teal,
          title: Text('Games List'),
        ),
        body: !getGames.isLoading.value
            ? const LoadingWidget(transition: Transition.leftToRight)
            : Container(
                color: Colors.black,
                child: GridView.builder(

                    // shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            childAspectRatio: 1.5 / 2,
                            crossAxisSpacing: 0.0,
                            mainAxisSpacing: 0.0),
                    itemCount: getGames.savedGameList!.length,
                    controller: getGames.scrollController.value,
                    itemBuilder: (BuildContext ctx, index) {
                      var game = getGames.savedGameList!;
                      return Container(
                          margin: EdgeInsets.all(10),
                          // decoration: MyDecoration.decoration,
                          child: GestureDetector(
                            onTap: () {
                              print(
                                game[index].id,
                              );
                              Get.to(GameDetailsPage(
                                getid: game[index].id,
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    game[index].backgroundImage ?? '',
                                    cacheKey: game[index].backgroundImage,
                                  ),
                                  fit: BoxFit.cover,
                                  scale: 2.0,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  decoration: BoxDecoration(
                                    color: AppColors.black.withOpacity(0.5),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                  ),
                                  child: Wrap(
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.end,
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.end,
                                    children: [
                                      const SizedBox(height: 10),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Text(
                                                  game[index].name ?? '',
                                                  style: const TextStyle(
                                                      color: AppColors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            game[index].metacritic != null
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                AppColors.teal),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(1),
                                                        child: Text(
                                                          game[index]
                                                              .metacritic
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            color:
                                                                AppColors.teal,
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                          ],
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 1,
                                        color: Colors.white,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Release date',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const Spacer(),
                                            Expanded(
                                              child: Text(
                                                game[index]
                                                        .released
                                                        .toString() ??
                                                    '',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Row(
                                          children: [
                                            const Text(
                                              'Genres',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 11),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const Spacer(),
                                            Expanded(
                                              child: Text(
                                                game?[index]
                                                        .genres
                                                        ?.map((e) => e.name)
                                                        .join(', ') ??
                                                    '',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11),
                                                softWrap: true,
                                                maxLines: 2,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ));
                    }),
              )));
  }
}
