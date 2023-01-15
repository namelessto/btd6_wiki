import 'package:btd6_wiki/business_logic/cubit/hero_cubit.dart';
import 'package:btd6_wiki/business_logic/cubit/heroes_cubit.dart';
import 'package:btd6_wiki/data/models/hero_tower.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HeroesView extends StatelessWidget {
  const HeroesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HeroesCubit, HeroesState>(
        builder: (context, state) {
          if (state.heroes.isEmpty || state.baseImages.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.heroes.isNotEmpty && state.baseImages.isNotEmpty) {
            List<HeroTower> heroes = state.heroes;
            List<NetworkImage> images = state.baseImages;
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600,
                childAspectRatio: 2 / 1,
              ),
              itemCount: heroes.length,
              itemBuilder: (context, index) {
                final hero = heroes.elementAt(index);
                final image = images.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      hero.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Text(
                                      hero.description,
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
                      print('Passed ${hero.name} id');
                      context.read<HeroCubit>().setHero(hero.id);
                      try {
                        context.goNamed(
                          'hero_view',
                        );
                      } on Exception catch (e) {
                        // TODO
                        print('error line 98 - $e');
                      }
                    },
                  ),
                );
              },
            );
          } else {
            return const Text('Error');
          }
        },
      ),
    );
  }
}
