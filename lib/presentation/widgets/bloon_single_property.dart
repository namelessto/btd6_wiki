import 'package:flutter/material.dart';

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
