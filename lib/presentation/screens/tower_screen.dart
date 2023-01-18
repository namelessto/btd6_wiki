import 'package:auto_size_text/auto_size_text.dart';
import 'package:btd6_wiki/business_logic/cubit/tower_cubit.dart';
import 'package:btd6_wiki/data/models/tower.dart';
import 'package:btd6_wiki/presentation/widgets/generic_info_widget.dart';
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
            final Tower tower = state.tower;
            final towerImage = state.towerImage;
            final paths = state.towerPaths;
            final pathsImages = state.pathsImages;
            final group1 = AutoSizeGroup();

            return SingleChildScrollView(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Column(
                children: [
                  GenericInfoWidget(
                    image: towerImage,
                    mainTitle: tower.name,
                    description: tower.description,
                    type: tower.type,
                    prop1Title: 'Cost',
                    prop1Line1:
                        'Easy: ${tower.cost.easy} | Medium: ${tower.cost.medium}',
                    prop1Line2:
                        'Hard: ${tower.cost.hard} | Impoppable: ${tower.cost.impoppable}',
                    prop2Title: 'Stats',
                    prop2Line1:
                        'Damage: ${tower.stats.damage} | Pierce: ${tower.stats.pierce} | Range: ${tower.stats.range}',
                    prop2Line2:
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
                                flex: 55,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  child: Center(
                                    child: AutoSizeText(
                                      paths[index].name,
                                      group: group1,
                                      textAlign: TextAlign.center,
                                      wrapWords: false,
                                      minFontSize: 9,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
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

//NewWidget(towerImage: towerImage, tower: tower, pathsImages: pathsImages, paths: paths, type: type)
// class NewWidget extends StatelessWidget {
//   const NewWidget({
//     Key? key,
//     required this.towerImage,
//     required this.tower,
//     required this.pathsImages,
//     required this.paths,
//     required this.type,
//   }) : super(key: key);
//
//   final NetworkImage towerImage;
//   final Tower tower;
//   final List<NetworkImage> pathsImages;
//   final List<TowerPath> paths;
//   final String type;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Image(
//           height: MediaQuery.of(context).size.height * 0.35,
//           image: towerImage,
//         ),
//         AutoSizeText(
//           tower.name,
//           style: Theme.of(context).textTheme.headline1,
//           textAlign: TextAlign.center,
//         ),
//         const Divider(),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: AutoSizeText(
//             tower.description,
//             style: Theme.of(context).textTheme.titleLarge,
//           ),
//         ),
//         const Divider(),
//         AutoSizeText(
//           'Type - ${tower.type}',
//           style: Theme.of(context).textTheme.titleLarge,
//         ),
//         const SizedBox(height: 15),
//         DisplayPropertyWidget(
//           title: 'Cost',
//           line1: 'Easy: ${tower.cost.easy} | Medium: ${tower.cost.medium}',
//           line2:
//               'Hard: ${tower.cost.hard} | Impoppable: ${tower.cost.impoppable}',
//         ),
//         const SizedBox(height: 15),
//         DisplayPropertyWidget(
//           title: 'Stats',
//           line1:
//               'Damage: ${tower.stats.damage} | Pierce: ${tower.stats.pierce} | Range: ${tower.stats.range}',
//           line2:
//               'Attack-speed: ${tower.stats.attackSpeed} | Type: ${tower.stats.type}',
//         ),
//         const Divider(),
//         GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 3,
//             childAspectRatio: 1 / 1.6,
//           ),
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: pathsImages.length,
//           itemBuilder: (context, index) {
//             return InkWell(
//               child: Card(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       flex: 85,
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: 20),
//                         child: Image(
//                           image: pathsImages[index],
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       flex: 50,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: 10,
//                           horizontal: 5,
//                         ),
//                         child: Center(
//                           child: AutoSizeText(
//                             paths[index].name,
//                             textAlign: TextAlign.center,
//                             wrapWords: false,
//                             style: Theme.of(context).textTheme.titleMedium,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               onTap: () {
//                 context.goNamed(
//                   'tower_path_view',
//                   queryParams: {
//                     'type': type,
//                     'pathIndex': index.toString(),
//                   },
//                 );
//               },
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
