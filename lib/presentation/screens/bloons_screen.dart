import 'package:btd6_wiki/business_logic/cubit/bloon_cubit.dart';
import 'package:btd6_wiki/business_logic/cubit/bloons_cubit.dart';
import 'package:btd6_wiki/data/models/bloon.dart';
import 'package:btd6_wiki/data/models/boss.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BloonsView extends StatelessWidget {
  const BloonsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<BloonsCubit, BloonsState>(
        builder: (context, state) {
          if (state.bloons.isEmpty ||
              state.bloonsImages.isEmpty ||
              state.bosses.isEmpty ||
              state.bossesImages.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.bloons.isNotEmpty &&
              state.bloonsImages.isNotEmpty &&
              state.bosses.isNotEmpty &&
              state.bossesImages.isNotEmpty) {
            List<Bloon> bloons = state.bloons;
            List<NetworkImage> bloonsImages = state.bloonsImages;
            List<Boss> bosses = state.bosses;
            List<NetworkImage> bossesImages = state.bossesImages;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                primary: true,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        'Bloons',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 2.3 / 1,
                    ),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: bloons.length,
                    itemBuilder: (context, index) {
                      final bloon = bloons.elementAt(index);
                      final image = bloonsImages.elementAt(index);
                      return InkWell(
                        borderRadius: BorderRadius.circular(8),
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: Image(
                                    image: image,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          bloon.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                        ),
                                        Text(
                                          bloon.type,
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          // print('Passed ${bloon.name} id');
                          context.read<BloonCubit>().setBloonFromAPI(bloon.id);

                          try {
                            context.goNamed(
                              'bloon_view',
                            );
                          } on Exception catch (e) {
                            // TODO
                            print('error line 98 - $e');
                          }
                        },
                      );
                    },
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 10),
                      child: Text(
                        'Bosses',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      maxCrossAxisExtent: 575,
                      childAspectRatio: 1.8 / 1,
                    ),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: bosses.length,
                    itemBuilder: (context, index) {
                      final boss = bosses.elementAt(index);
                      final image = bossesImages.elementAt(index);
                      return InkWell(
                        borderRadius: BorderRadius.circular(8),
                        child: Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              //mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Image(
                                    image: image,
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          boss.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        Text(
                                          boss.type,
                                          //softWrap: true,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          //print('Passed ${boss.name} id');
                          try {
                            context.goNamed(
                              'hero_view',
                            );
                          } on Exception catch (e) {
                            // TODO
                            print('error line 98 - $e');
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Text('Error');
          }
        },
      ),
    );
  }
}
