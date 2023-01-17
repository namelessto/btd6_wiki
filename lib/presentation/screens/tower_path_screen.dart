import 'package:auto_size_text/auto_size_text.dart';
import 'package:btd6_wiki/business_logic/cubit/tower_cubit.dart';
import 'package:btd6_wiki/data/models/tower.dart';
import 'package:btd6_wiki/presentation/widgets/display_property_widget.dart';
import 'package:btd6_wiki/presentation/widgets/tower_path_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: AppBar(),
      body: BlocBuilder<TowerCubit, TowerState>(
        builder: (context, state) {
          TowerPath path;
          NetworkImage pathImage;
          int index = int.parse(strIndex);
          if (state is TowerLoadedState) {
            path = state.towerPaths[index];
            pathImage = state.pathsImages[index];
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 15,
              ),
              child: ListView(
                children: [
                  Image(
                    height: MediaQuery.of(context).size.height * 0.35,
                    image: pathImage,
                  ),
                  AutoSizeText(
                    path.name,
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                    wrapWords: false,
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: AutoSizeText(
                      path.description,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const Divider(),
                  DisplayPropertyWidget(
                    title: 'Cost',
                    line1:
                        'Easy: ${path.cost.easy} | Medium: ${path.cost.medium}',
                    line2:
                        'Hard: ${path.cost.hard} | Impoppable: ${path.cost.impoppable}',
                  ),
                  PathExpansionTile(
                    effects: path.effects,
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
