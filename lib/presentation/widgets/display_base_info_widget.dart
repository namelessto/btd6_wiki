import 'package:auto_size_text/auto_size_text.dart';
import 'package:btd6_wiki/presentation/widgets/display_property_widget.dart';
import 'package:flutter/material.dart';

class DisplayBaseInfoWidget extends StatelessWidget {
  const DisplayBaseInfoWidget({
    Key? key,
    required this.image,
    required this.mainTitle,
    required this.description,
    this.type,
    required this.prop1Title,
    required this.prop1Line1,
    required this.prop1Line2,
    this.prop2Title,
    this.prop2Line1,
    this.prop2Line2,
  }) : super(key: key);

  final NetworkImage image;
  final String mainTitle;
  final String description;
  final String? type;
  final String prop1Title;
  final String prop1Line1;
  final String prop1Line2;
  final String? prop2Title;
  final String? prop2Line1;
  final String? prop2Line2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          height: MediaQuery.of(context).size.height * 0.35,
          image: image,
        ),
        AutoSizeText(
          mainTitle,
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AutoSizeText(
            description,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const Divider(),
        type != null
            ? AutoSizeText(
                'Type - $type',
                style: Theme.of(context).textTheme.titleLarge,
              )
            : Container(),
        const SizedBox(height: 15),
        DisplayPropertyWidget(
          title: prop1Title,
          line1: prop1Line1,
          line2: prop1Line2,
        ),
        const SizedBox(height: 15),
        prop2Title != null
            ? DisplayPropertyWidget(
                title: prop2Title!,
                line1: prop2Line1!,
                line2: prop2Line2!,
              )
            : Container(),
      ],
    );
  }
}
