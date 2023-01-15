import 'package:btd6_wiki/business_logic/cubit/bloon_cubit.dart';
import 'package:btd6_wiki/data/models/bloon.dart';
import 'package:btd6_wiki/presentation/widgets/bloon_immunities_expansion_tile.dart';
import 'package:btd6_wiki/presentation/widgets/bloon_properties_expansion_tile.dart';
import 'package:btd6_wiki/presentation/widgets/bloon_single_property.dart';
import 'package:btd6_wiki/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloonView extends StatelessWidget {
  const BloonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
          builder: (context, constraints) =>
              BlocBuilder<BloonCubit, BloonState>(
                builder: (context, state) {
                  if (state is BloonInitialState ||
                      state is BloonLoadingState) {
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
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Center(
                              child: Image(
                                image: bloonImage,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              bloon.name,
                              style: Theme.of(context).textTheme.displayMedium,
                              //textAlign: TextAlign.start,
                            ),
                          ),
                          const Divider(),
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
                              ? BloonSingleProperty(
                                  bloonProperties: {'HP': bloon.hp})
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
                              : const BloonSingleProperty(bloonProperties: {
                                  'Initial Round ABR': 'N/A'
                                }),
                          bloon.immunities.isNotEmpty
                              ? ImmunitiesExpansionTile(
                                  bloon: bloon,
                                )
                              : const BloonSingleProperty(
                                  bloonProperties: {'Immunities': 'N/A'}),
                          bloon.variants.isNotEmpty
                              ? BloonPropertyExpansionTile(
                                  property: bloonPropertiesForExpansion[0],
                                  title: 'Variants',
                                  bloonProperties: state.bloon.variants,
                                  images: state.bloonImages,
                                  count: bloon.children
                                      .map((child) => child.count)
                                      .toList(),
                                )
                              : const BloonSingleProperty(
                                  bloonProperties: {'Variants': 'N/A'}),
                          bloon.children.isNotEmpty
                              ? BloonPropertyExpansionTile(
                                  property: bloonPropertiesForExpansion[1],
                                  title: 'Children Bloons',
                                  bloonProperties: state.children,
                                  images: state.childrenImages,
                                  count: bloon.children
                                      .map((child) => child.count)
                                      .toList(),
                                )
                              : const BloonSingleProperty(
                                  bloonProperties: {'Children': 'N/A'}),
                          bloon.parents.isNotEmpty
                              ? BloonPropertyExpansionTile(
                                  property: bloonPropertiesForExpansion[2],
                                  title: 'Parents Bloons',
                                  bloonProperties: state.parents,
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
              )),
    );
  }
}
