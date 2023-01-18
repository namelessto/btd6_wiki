import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class GenericPropertyWidget extends StatelessWidget {
  const GenericPropertyWidget({
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
    final group = AutoSizeGroup();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
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
            group: group,
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 1,
            wrapWords: false,
            softWrap: false,
          ),
        ),
        Flexible(
          flex: 1,
          child: AutoSizeText(
            line2,
            group: group,
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 1,
            wrapWords: false,
            softWrap: false,
          ),
        ),
      ],
    );
  }
}
