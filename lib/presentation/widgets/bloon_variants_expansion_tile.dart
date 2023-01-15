import 'package:btd6_wiki/data/models/bloon.dart';
import 'package:flutter/material.dart';

class VariantsExpansionTile extends StatelessWidget {
  const VariantsExpansionTile({
    Key? key,
    required this.bloon,
    required this.images,
  }) : super(key: key);

  final Bloon bloon;
  final List<NetworkImage> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(
            'Variants',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          children: [
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: bloon.variants.length,
              itemBuilder: (context, index) {
                var variant = bloon.variants.elementAt(index);
                var image = images.elementAt(index + 1);
                return Column(
                  children: [
                    Image(image: image),
                    const SizedBox(height: 10),
                    Text(
                      variant,
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
