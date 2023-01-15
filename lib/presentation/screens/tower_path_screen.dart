import 'package:btd6_wiki/business_logic/cubit/tower_cubit.dart';
import 'package:btd6_wiki/data/models/common.dart';
import 'package:btd6_wiki/data/models/tower.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TowerPathView extends StatelessWidget {
  const TowerPathView({
    Key? key,
    required this.strIndex,
    required this.type,
  }) : super(key: key);

  final String type;
  final String strIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: BlocBuilder<TowerCubit, TowerState>(
        builder: (context, state) {
          TowerPath path;
          NetworkImage pathImage;
          int index = int.parse(strIndex);
          if (state is TowerLoadedState) {
            path = state.towerPaths[index];
            pathImage = state.pathsImages[index];
          } else {
            Cost cost = const Cost(0, 0, 0, 0);
            path =
                TowerPath('name', 'description', cost, 2, const [], 'source');
            pathImage = const NetworkImage('https://picsum.photos/250?image=9');
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: ListView(
              children: [
                Image(
                  image: pathImage,
                ),
                const SizedBox(height: 15),
                const Divider(),
                Text(
                  path.name,
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 15),
                Text(
                  path.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Divider(),
                const SizedBox(height: 6),
                Text(
                  'Cost',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  'Easy: ${path.cost.easy} | Medium: ${path.cost.medium} | Hard: ${path.cost.hard} | Impoppable: ${path.cost.impoppable}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Divider(),
                ExpansionTile(
                  title: const Text('Advanced Effects'),
                  children: _buildExpantionTile(path.effects),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _buildExpantionTile(List<String> effects) {
    List<Widget> list = [];

    for (String effect in effects) {
      list.add(Card(
        child: ListTile(
          title: Text(effect),
        ),
      ));
    }

    return list;
  }
}
