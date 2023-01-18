import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class GenericCard extends StatelessWidget {
  const GenericCard({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.maxDescriptionLines,
    required this.callback,
  }) : super(key: key);

  final NetworkImage image;
  final String title;
  final String description;
  final int maxDescriptionLines;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    final groupTitle = AutoSizeGroup();
    final groupSubtitle = AutoSizeGroup();
    return Card(
      elevation: 4,
      child: Center(
        child: ListTile(
          leading: Image(
            height: MediaQuery.of(context).size.height,
            //width: MediaQuery.of(context).size.width * 0.15,
            image: image,
          ),
          title: AutoSizeText(
            title,
            group: groupTitle,
            //style: Theme.of(context).textTheme.titleLarge,
            wrapWords: false,
            //minFontSize: 18,
          ),
          subtitle: AutoSizeText(
            description,
            group: groupSubtitle,
            //style: Theme.of(context).textTheme.bodyText1,
            maxLines: maxDescriptionLines,
            wrapWords: false,
            overflow: TextOverflow.ellipsis,
            //minFontSize: 12,
          ),
          onTap: callback,
        ),
      ),
    );
  }
}
