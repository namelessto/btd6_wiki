import 'package:btd6_wiki/business_logic/cubit/bloon_cubit.dart';
import 'package:btd6_wiki/data/models/bloon.dart';
import 'package:btd6_wiki/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BloonPropertyExpansionTile extends StatelessWidget {
  const BloonPropertyExpansionTile({
    Key? key,
    required this.count,
    required this.title,
    required this.bloonProperties,
    required this.images,
    required this.property,
  }) : super(key: key);

  final List<int?> count;
  final String title;
  final String property;
  final List<dynamic> bloonProperties;
  final List<NetworkImage> images;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 8),
        childrenPadding:
            const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              crossAxisSpacing: 5,
              maxCrossAxisExtent: 100,
              childAspectRatio: 1 / 1.77,
            ),
            primary: false,
            shrinkWrap: true,
            itemCount: bloonProperties.length,
            itemBuilder: (context, index) {
              if (property == bloonPropertiesForExpansion[0]) {
                String bloonProperty = bloonProperties.elementAt(index);
                var image = images.elementAt(index + 1);
                return _property(bloonProperty, image, context);
              } else if (property == bloonPropertiesForExpansion[1]) {
                Bloon bloon = bloonProperties.elementAt(index);
                var image = images.elementAt(index);
                int? childCount = count.elementAt(index);
                String text = '${bloon.name} x $childCount';
                return InkWell(
                  child: _property(text, image, context),
                  onTap: () {
                    context.read<BloonCubit>().setBloonFromAPI(bloon.id);
                    try {
                      context.pushReplacementNamed(
                        'bloon_view',
                      );
                    } on Exception catch (e) {
                      // TODO add error page
                    }
                  },
                );
              } else if (property == bloonPropertiesForExpansion[2]) {
                Bloon bloon = bloonProperties.elementAt(index);
                var image = images.elementAt(index);
                return InkWell(
                  child: _property(bloon.name, image, context),
                  onTap: () {
                    context.read<BloonCubit>().setBloonFromAPI(bloon.id);
                    try {
                      context.pushReplacementNamed(
                        'bloon_view',
                      );
                    } on Exception catch (e) {
                      // TODO add error page
                    }
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  _property(String text, NetworkImage image, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 15,
          child: Image(
            image: image,
          ),
        ),
        Expanded(
          flex: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
              maxLines: 3,
            ),
          ),
        ),
      ],
    );
  }
}
