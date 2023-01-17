import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DisplayPropertyWidget extends StatelessWidget {
  const DisplayPropertyWidget({
    Key? key,
    required this.title,
    required this.line1,
    required this.line2,
  }) : super(key: key);

  final String title;
  final String line1;
  final String line2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 1,
          child: Center(
            child: AutoSizeText(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: AutoSizeText(
            line1,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Flexible(
          flex: 1,
          child: AutoSizeText(
            line2,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
