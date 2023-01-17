import 'package:btd6_wiki/business_logic/cubit/tower_cubit.dart';
import 'package:btd6_wiki/business_logic/cubit/towers_cubit.dart';
import 'package:btd6_wiki/data/models/tower.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TowersView extends StatelessWidget {
  const TowersView({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$type Towers'),
      ),
      body: BlocBuilder<TowersCubit, TowersState>(
        builder: (context, state) {
          if (state.towers.isEmpty || state.baseImages.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.towers.isNotEmpty && state.baseImages.isNotEmpty) {
            List<Tower> towers = [];
            List<NetworkImage> images = [];
            if (type != 'All') {
              towers =
                  state.towers.where((tower) => tower.type == type).toList();
              List<String> ids = towers.map((tower) => tower.id).toList();
              images = state.baseImages
                  .where((image) => ids.any((id) => image.url.contains(id)))
                  .map((e) => e)
                  .toList();
            } else {
              towers = state.towers;
              images = state.baseImages;
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600, // number of columns
                childAspectRatio: 2 / 1, // aspect ratio of the tiles
              ),
              itemCount: towers.length,
              itemBuilder: (context, index) {
                final tower = towers.elementAt(index);
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
                              flex: 3,
                              child: Image(
                                image: image,
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      tower.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Text(
                                      tower.type,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    Text(
                                      tower.description,
                                      softWrap: true,
                                      maxLines: 3,
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
                      context.read<TowerCubit>().setTower(tower.id);
                      try {
                        context.goNamed(
                          'tower_view',
                          queryParams: {'type': type},
                        );
                      } on Exception catch (e) {
                        // TODO add error page
                      }
                    },
                  ),
                );
              },
            );
          } else {
            return const Text('error');
          }
        },
      ),
    );
  }
}
