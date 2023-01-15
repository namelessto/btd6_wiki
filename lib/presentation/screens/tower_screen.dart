import 'package:btd6_wiki/business_logic/cubit/tower_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TowerView extends StatelessWidget {
  const TowerView({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<TowerCubit, TowerState>(
          builder: (context, state) {
            if (state is TowerLoadingState) {
              return const Text('Loading..');
            } else if (state is TowerErrorState) {
              return const Center(
                child: Icon(Icons.close),
              );
            } else if (state is TowerLoadedState) {
              return Text(state.tower.name);
            } else {
              return Container();
            }
          },
        ),
      ),
      body: BlocBuilder<TowerCubit, TowerState>(
        builder: (context, state) {
          if (state is TowerLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TowerErrorState) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is TowerLoadedState) {
            final tower = state.tower;
            final towerImage = state.towerImage;
            final paths = state.towerPaths;
            final pathsImages = state.pathsImages;
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [
                Image(
                  height: MediaQuery.of(context).size.height * 0.4,
                  image: towerImage,
                ),
                const Divider(),
                Text(
                  tower.name,
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    tower.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const Divider(),
                Center(
                  child: Text(
                    'Type - ${tower.type}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const SizedBox(height: 6),
                Column(
                  children: [
                    Center(
                      child: Text(
                        'Cost',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Easy: ${tower.cost.easy} | Medium: ${tower.cost.medium}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Hard: ${tower.cost.hard} | Impoppable: ${tower.cost.impoppable}',
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
                      'Damage: ${tower.stats.damage} | Pierce: ${tower.stats.pierce} | Range: ${tower.stats.range}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'Attack-speed: ${tower.stats.attackSpeed} | Type: ${tower.stats.type}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const Divider(),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    crossAxisCount: 3,
                    childAspectRatio: 1 / 1.3,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: pathsImages.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Image(
                                  image: pathsImages[index],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    paths[index].name,
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {
                        context.goNamed(
                          'tower_path_view',
                          queryParams: {
                            'type': type,
                            'pathIndex': index.toString(),
                          },
                        );
                      },
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
