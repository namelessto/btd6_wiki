import 'package:btd6_wiki/data/models/bloon.dart';
import 'package:flutter/material.dart';

class ImmunitiesExpansionTile extends StatelessWidget {
  const ImmunitiesExpansionTile({
    Key? key,
    required this.bloon,
  }) : super(key: key);

  final Bloon bloon;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        'Immunities',
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
      children: [
        ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: bloon.immunities.length,
          itemBuilder: (context, index) {
            var immunity = bloon.immunities.elementAt(index);
            return Column(
              children: [
                Text(
                  '${index + 1}: $immunity',
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
