import 'package:btd6_wiki/business_logic/cubit/hero_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeroView extends StatelessWidget {
  const HeroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<HeroCubit, HeroState>(
          builder: (context, state) {
            if (state is HeroInitialState || state is HeroLoadingState) {
              return const Text('Loading..');
            } else if (state is HeroErrorState) {
              return const Center(
                child: Icon(Icons.close),
              );
            } else if (state is HeroLoadedState) {
              return Text(state.hero.name);
            } else {
              return Container();
            }
          },
        ),
      ),
      body: BlocBuilder<HeroCubit, HeroState>(
        builder: (context, state) {
          if (state is HeroInitialState || state is HeroLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HeroErrorState) {
            return const Center(
              child: Icon(Icons.error),
            );
          } else if (state is HeroLoadedState) {
            final hero = state.hero;
            final heroImages = state.heroImages;
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              children: [
                Image(
                  //height: MediaQuery.of(context).size.height * 0.4,
                  image: heroImages[0][0],
                ),
                const Divider(),
                Text(
                  hero.name,
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    hero.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Cost',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Easy: ${hero.cost.easy} | Medium: ${hero.cost.medium}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Hard: ${hero.cost.hard} | Impoppable: ${hero.cost.impoppable}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Stats',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Damage: ${hero.stats.damage} | Pierce: ${hero.stats.pierce} | Range: ${hero.stats.range}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Attack-speed: ${hero.stats.attackSpeed} | Type: ${hero.stats.type}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const Divider(),
                GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 1 / 1.6,
                  ),
                  itemCount: hero.levels.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              'Level ${index + 1}',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 23),
                              child: Text(
                                hero.levels[index].description,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'XP needed: ${hero.levels[index].xp}',
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Rounds:',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'Easy: ${hero.levels[index].rounds.easy} | Medium: ${hero.levels[index].rounds.medium}',
                            ),
                            Text(
                              'Hard: ${hero.levels[index].rounds.hard} | Impoppable: ${hero.levels[index].rounds.impoppable}',
                            ),
                            const SizedBox(height: 5),
                            Expanded(
                              child: _imageOnChange(state, index),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

Widget _imageOnChange(HeroLoadedState state, int index) {
  if (index == 0) {
    return Image(image: state.heroImages[0][0]);
  }
  if (state.hero.skinChange.contains(index + 1)) {
    int imageIndex = state.hero.skinChange.indexOf(index + 1) + 1;
    return Image(image: state.heroImages[0].elementAt(imageIndex));
  } else {
    return Container();
  }
}
