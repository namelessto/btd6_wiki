import 'package:btd6_wiki/business_logic/cubit/bloon_cubit.dart';
import 'package:btd6_wiki/data/models/bloon.dart';
import 'package:btd6_wiki/presentation/widgets/bloon_hierarchy_expansion_tile.dart';
import 'package:btd6_wiki/presentation/widgets/bloon_immunities_expansion_tile.dart';
import 'package:btd6_wiki/presentation/widgets/bloon_variants_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloonViewBody extends StatelessWidget {
  const BloonViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<BloonCubit, BloonState>(
        builder: (context, state) {
          if (state is BloonInitialState || state is BloonLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BloonErrorState) {
            return const Center(
              child: Text('Error'),
            );
          } else if (state is BloonLoadedState) {
            Bloon bloon = state.bloon;
            NetworkImage bloonImage = state.bloonImages.first;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image(
                      image: bloonImage,
                    ),
                  ),
                  const Divider(),
                  Text(
                    bloon.name,
                    style: Theme.of(context).textTheme.displayMedium,
                    //textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Type: ${bloon.type}',
                    style: Theme.of(context).textTheme.bodyLarge,
                    // textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'RBE: ${bloon.rbe}',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Speed: ${bloon.speed}',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  bloon.hp != null
                      ? BloonSingleProperty(bloonProperties: {'HP': bloon.hp})
                      : const BloonSingleProperty(
                          bloonProperties: {'HP': 'N/A'}),
                  bloon.initialRound != null
                      ? BloonSingleProperty(bloonProperties: {
                          'Initial Round': bloon.initialRound
                        })
                      : const BloonSingleProperty(
                          bloonProperties: {'Initial Round': 'N/A'}),
                  bloon.initialRoundABR != null
                      ? BloonSingleProperty(bloonProperties: {
                          'Initial Round ABR': bloon.initialRoundABR
                        })
                      : const BloonSingleProperty(
                          bloonProperties: {'Initial Round ABR': 'N/A'}),
                  bloon.immunities.isNotEmpty
                      ? ImmunitiesExpansionTile(
                          bloon: bloon,
                        )
                      : const BloonSingleProperty(
                          bloonProperties: {'Immunities': 'N/A'}),
                  bloon.variants.isNotEmpty
                      ? VariantsExpansionTile(
                          bloon: bloon,
                          images: state.bloonImages,
                        )
                      : const BloonSingleProperty(
                          bloonProperties: {'Variants': 'N/A'}),
                  bloon.children.isNotEmpty
                      ? HierarchyExpansionTile(
                          title: 'Children Bloons',
                          bloons: state.children,
                          images: state.childrenImages,
                          count: bloon.children
                              .map((child) => child.count)
                              .toList(),
                        )
                      : const BloonSingleProperty(
                          bloonProperties: {'Children': 'N/A'}),
                  bloon.parents.isNotEmpty
                      ? HierarchyExpansionTile(
                          title: 'Parents Bloons',
                          bloons: state.parents,
                          images: state.parentsImages,
                          count: const [],
                        )
                      : const BloonSingleProperty(
                          bloonProperties: {'Parents': 'N/A'}),
                ],
              ),
            );
          }
          return Container();
        },
      );
    });
  }
}

class BloonSingleProperty extends StatelessWidget {
  final Map<String, dynamic> bloonProperties;

  const BloonSingleProperty({
    Key? key,
    required this.bloonProperties,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final entry = bloonProperties.entries.first;
    return Column(
      children: [
        Text(
          '${entry.key}: ${entry.value}',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
