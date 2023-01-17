import 'package:auto_size_text/auto_size_text.dart';
import 'package:btd6_wiki/business_logic/cubit/tower_cubit.dart';
import 'package:btd6_wiki/presentation/widgets/display_property_widget.dart';
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
            return SingleChildScrollView(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    height: MediaQuery.of(context).size.height * 0.35,
                    image: towerImage,
                  ),
                  AutoSizeText(
                    tower.name,
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: AutoSizeText(
                      tower.description,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const Divider(),
                  AutoSizeText(
                    'Type - ${tower.type}',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 15),
                  DisplayPropertyWidget(
                    title: 'Cost',
                    line1:
                        'Easy: ${tower.cost.easy} | Medium: ${tower.cost.medium}',
                    line2:
                        'Hard: ${tower.cost.hard} | Impoppable: ${tower.cost.impoppable}',
                  ),
                  const SizedBox(height: 15),
                  DisplayPropertyWidget(
                    title: 'Stats',
                    line1:
                        'Damage: ${tower.stats.damage} | Pierce: ${tower.stats.pierce} | Range: ${tower.stats.range}',
                    line2:
                        'Attack-speed: ${tower.stats.attackSpeed} | Type: ${tower.stats.type}',
                  ),
                  const Divider(),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1 / 1.6,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: pathsImages.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 85,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Image(
                                    image: pathsImages[index],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 50,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 5,
                                  ),
                                  child: Center(
                                    child: AutoSizeText(
                                      paths[index].name,
                                      textAlign: TextAlign.center,
                                      wrapWords: false,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
