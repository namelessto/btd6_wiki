import 'package:btd6_wiki/data/models/bloon.dart';
import 'package:flutter/material.dart';

class HierarchyExpansionTile extends StatelessWidget {
  const HierarchyExpansionTile({
    Key? key,
    required this.count,
    required this.title,
    required this.bloons,
    required this.images,
  }) : super(key: key);

  final List<int?> count;
  final String title;
  final List<Bloon> bloons;
  final List<NetworkImage> images;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
      children: [
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: bloons.length,
          itemBuilder: (context, index) {
            var bloonInHierarchy = bloons.elementAt(index);
            var image = images.elementAt(index);
            return Column(
              children: [
                Image(image: image),
                const SizedBox(height: 10),
                count.isNotEmpty
                    ? Text(
                        '${bloonInHierarchy.name} x ${count.elementAt(index)}',
                      )
                    : Text(
                        bloonInHierarchy.name,
                      ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ],
    );
  }
}
