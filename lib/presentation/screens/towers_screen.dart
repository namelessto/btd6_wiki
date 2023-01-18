import 'package:btd6_wiki/business_logic/cubit/tower_cubit.dart';
import 'package:btd6_wiki/business_logic/cubit/towers_cubit.dart';
import 'package:btd6_wiki/data/models/tower.dart';
import 'package:btd6_wiki/presentation/widgets/generic_card_widget.dart';
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
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
                maxCrossAxisExtent: 600,
                mainAxisExtent: 100,
                childAspectRatio: 2.2 / 1,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              itemCount: towers.length,
              itemBuilder: (context, index) {
                final tower = towers.elementAt(index);
                final image = images.elementAt(index);
                return InkWell(
                  borderRadius: BorderRadius.circular(8),
                  child: GenericCard(
                    image: image,
                    title: tower.name,
                    description: tower.description,
                    maxDescriptionLines: 3,
                    callback: () {
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
                  // onTap: () {
                  //   context.read<TowerCubit>().setTower(tower.id);
                  //   try {
                  //     context.goNamed(
                  //       'tower_view',
                  //       queryParams: {'type': type},
                  //     );
                  //   } on Exception catch (e) {
                  //     // TODO add error page
                  //   }
                  // },
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
