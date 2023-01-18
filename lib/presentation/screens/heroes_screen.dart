import 'package:btd6_wiki/business_logic/cubit/hero_cubit.dart';
import 'package:btd6_wiki/business_logic/cubit/heroes_cubit.dart';
import 'package:btd6_wiki/data/models/hero_tower.dart';
import 'package:btd6_wiki/presentation/widgets/generic_card_widget.dart';
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
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
                maxCrossAxisExtent: 600,
                mainAxisExtent: 100,
                childAspectRatio: 2.2 / 1,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              itemCount: heroes.length,
              itemBuilder: (context, index) {
                final hero = heroes.elementAt(index);
                final image = images.elementAt(index);
                return InkWell(
                  borderRadius: BorderRadius.circular(8),
                  child: GenericCard(
                    image: image,
                    title: hero.name,
                    description: hero.description,
                    maxDescriptionLines: 3,
                    callback: () {
                      context.read<HeroCubit>().setHero(hero.id);
                      try {
                        context.goNamed(
                          'hero_view',
                        );
                      } on Exception catch (e) {
                        // TODO add error page

                      }
                    },
                  ),
                  // onTap: () {
                  //   context.read<HeroCubit>().setHero(hero.id);
                  //   try {
                  //     context.goNamed(
                  //       'hero_view',
                  //     );
                  //   } on Exception catch (e) {
                  //     // TODO add error page
                  //   }
                  // },
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
