import 'package:bloc/bloc.dart';
import 'package:btd6_wiki/data/models/bloon.dart';
import 'package:btd6_wiki/data/models/boss.dart';
import 'package:btd6_wiki/data/repositories/btd_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bloons_state.dart';

class BloonsCubit extends Cubit<BloonsState> {
  BloonsCubit({required this.btdRepo})
      : super(const BloonsState(
          bloons: [],
          bosses: [],
          bloonsImages: [],
          bossesImages: [],
        ));

  final BTDRepo btdRepo;

  void initialBloons() async {
    try {
      List<Bloon> bloons = await btdRepo.fetchAllBloons();
      List<Boss> bosses = await btdRepo.fetchBloonsBosses();

      List<String> bloonsIds = bloons.map((e) => e.id).toList();
      List<String> bossesIds = bosses.map((e) => e.id).toList();

      List<NetworkImage> bloonsImages = btdRepo.fetchBloonsImages(bloonsIds);
      List<NetworkImage> bossesImages = btdRepo.fetchBloonsImages(bossesIds);

      emit(BloonsState(
        bloons: bloons,
        bosses: bosses,
        bloonsImages: bloonsImages,
        bossesImages: bossesImages,
      ));
    } on Exception catch (e) {
      // TODO add error page
    }
  }
}
