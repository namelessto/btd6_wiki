import 'package:auto_size_text/auto_size_text.dart';
import 'package:btd6_wiki/business_logic/cubit/hero_cubit.dart';
import 'package:btd6_wiki/data/models/hero_tower.dart';
import 'package:btd6_wiki/presentation/widgets/display_base_info_widget.dart';
import 'package:btd6_wiki/presentation/widgets/display_property_widget.dart';
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
              children: [
                DisplayBaseInfoWidget(
                  image: heroImages[0][0],
                  mainTitle: hero.name,
                  description: hero.description,
                  prop1Title: 'Cost',
                  prop1Line1:
                      'Easy: ${hero.cost.easy} | Medium: ${hero.cost.medium}',
                  prop1Line2:
                      'Hard: ${hero.cost.hard} | Impoppable: ${hero.cost.impoppable}',
                  prop2Title: 'Stats',
                  prop2Line1:
                      'Damage: ${hero.stats.damage} | Pierce: ${hero.stats.pierce} | Range: ${hero.stats.range}',
                  prop2Line2:
                      'Attack-speed: ${hero.stats.attackSpeed} | Type: ${hero.stats.type}',
                ),
                const Divider(),
                GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 450,
                    childAspectRatio: 1 / 2,
                  ),
                  itemCount: hero.levels.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: shouldShowImage(hero, index)
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Image(
                                            image: heroImages[0]
                                                [imageIndex(hero, index)],
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: AutoSizeText(
                                              'Image at level ${index + 1}',
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Center(
                                      child: AutoSizeText(
                                        'Level ${index + 1}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: AutoSizeText(
                                        hero.levels[index].description,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        wrapWords: false,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: AutoSizeText(
                                      'XP needed: ${hero.levels[index].xp}',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      wrapWords: false,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: DisplayPropertyWidget(
                                      title: 'Rounds',
                                      line1:
                                          'Easy: ${hero.levels[index].rounds.easy} | Medium: ${hero.levels[index].rounds.medium}',
                                      line2:
                                          'Hard: ${hero.levels[index].rounds.hard} | Impoppable: ${hero.levels[index].rounds.impoppable}',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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

bool shouldShowImage(HeroTower hero, int index) {
  if (index == 0 || hero.skinChange.contains(index + 1)) {
    return true;
  } else {
    return false;
  }
}

int imageIndex(HeroTower hero, int index) {
  if (index == 0) {
    return 0;
  }
  return hero.skinChange.indexOf(index + 1) + 1;
}
