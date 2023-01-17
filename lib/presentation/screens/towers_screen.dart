import 'package:auto_size_text/auto_size_text.dart';
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
            return Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisSpacing: 0,
                  maxCrossAxisExtent: 600, // number of columns
                  childAspectRatio: 2.7 / 1, // aspect ratio of the tiles
                ),
                itemCount: towers.length,
                itemBuilder: (context, index) {
                  final tower = towers.elementAt(index);
                  final image = images.elementAt(index);
                  return InkWell(
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Card(
                        elevation: 5,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              flex: 7,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image(
                                  image: image,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 18,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    flex: 20,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 13,
                                      ),
                                      child: AutoSizeText(
                                        tower.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 35,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 10,
                                        right: 10,
                                      ),
                                      child: AutoSizeText(
                                        tower.description,
                                        wrapWords: false,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
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
                  );
                },
              ),
            );
          } else {
            return const Text('error');
          }
        },
      ),
    );
  }
}
