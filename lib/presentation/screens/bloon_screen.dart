import 'package:btd6_wiki/business_logic/cubit/bloon_cubit.dart';
import 'package:btd6_wiki/data/models/bloon.dart';
import 'package:btd6_wiki/presentation/widgets/bloon_hierarchy_expansion_tile.dart';
import 'package:btd6_wiki/presentation/widgets/bloon_variants_expansion_tile.dart';
import 'package:btd6_wiki/presentation/widgets/bloon_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloonView extends StatelessWidget {
  const BloonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const BloonViewBody(),
    );
  }
}
