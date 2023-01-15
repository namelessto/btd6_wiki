import 'package:btd6_wiki/data/models/bloon.dart';
import 'package:btd6_wiki/utilities/constants.dart';
import 'package:flutter/material.dart';

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
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 10,
              crossAxisSpacing: 15,
              maxCrossAxisExtent: 200,
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
                Bloon child = bloonProperties.elementAt(index);
                var image = images.elementAt(index);
                int? childCount = count.elementAt(index);
                String text = '${child.name} x $childCount';
                return _property(text, image, context);
              } else if (property == bloonPropertiesForExpansion[2]) {
                Bloon parent = bloonProperties.elementAt(index);
                var image = images.elementAt(index);
                return _property(parent.name, image, context);
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
      mainAxisSize: MainAxisSize.max,
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
              style: Theme.of(context).textTheme.bodyLarge,
              softWrap: true,
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }
}
