import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class GenericListExpansionWidget extends StatelessWidget {
  const GenericListExpansionWidget({
    Key? key,
    required this.effects,
    required this.title,
  }) : super(key: key);

  final String title;
  final List<String> effects;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: AutoSizeText(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        children: [
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: effects.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(5),
                  child: AutoSizeText(
                    '${index + 1}: ${effects[index]}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
