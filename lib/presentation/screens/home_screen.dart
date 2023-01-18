import 'package:auto_size_text/auto_size_text.dart';
import 'package:btd6_wiki/business_logic/cubit/bloons_cubit.dart';
import 'package:btd6_wiki/business_logic/cubit/heroes_cubit.dart';
import 'package:btd6_wiki/business_logic/cubit/towers_cubit.dart';
import 'package:btd6_wiki/data/repositories/btd_repo.dart';
import 'package:btd6_wiki/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloons TD 6 Wiki'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const ListTile(
              title: Text('Bloons TD 6 Wiki'),
            ),
            ExpansionTile(
              title: Text(categories[0]),
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: classes.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(classes[index]),
                      onTap: () {
                        context.read<TowersCubit>().initialTowers();
                        context.goNamed(
                          'towers_view',
                          queryParams: {'type': classes[index]},
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            ListTile(
              title: Text(categories[1]),
              onTap: () {
                context.read<HeroesCubit>().initialHeroes();
                context.goNamed('heroes_view');
              },
            ),
            ListTile(
              title: Text(categories[2]),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 10,
          crossAxisSpacing: 5,
          mainAxisExtent: 220,
          maxCrossAxisExtent: 200,
          childAspectRatio: 1 / 2,
        ),
        padding: const EdgeInsets.all(10),
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(8),
            child: MenuCard(
              image: BTDRepo().fetchTowerImage(dartMonkey),
              title: 'Towers',
            ),
            onTap: () {
              context.read<TowersCubit>().initialTowers();
              context.goNamed(
                'towers_view',
                queryParams: {'type': 'All'},
              );
            },
          ),
          InkWell(
            borderRadius: BorderRadius.circular(8),
            child: MenuCard(
              image: BTDRepo().fetchHeroImage(quincy),
              title: 'Heroes',
            ),
            onTap: () {
              context.read<HeroesCubit>().initialHeroes();
              context.goNamed('heroes_view');
            },
          ),
          InkWell(
            borderRadius: BorderRadius.circular(8),
            child: MenuCard(
              image: BTDRepo().fetchBloonImage('bloonarius'),
              title: 'Bloons & Bosses',
            ),
            onTap: () {
              context.read<BloonsCubit>().initialBloons();
              context.goNamed(
                'bloons_view',
              );
            },
          ),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final NetworkImage image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Image(
                image: image,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: AutoSizeText(
                title,
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
