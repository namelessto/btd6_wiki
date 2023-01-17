import 'package:bloc/bloc.dart';
import 'package:btd6_wiki/data/models/hero_tower.dart';
import 'package:btd6_wiki/data/repositories/btd_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'hero_state.dart';

class HeroCubit extends Cubit<HeroState> {
  HeroCubit({required this.btdRepo}) : super(HeroInitialState());

  bool _dataFetched = false;
  String _id = '';

  final BTDRepo btdRepo;

  void setHero(String id) async {
    try {
      if (!_dataFetched || _id != id) {
        emit(HeroLoadingState());
        // -- Get Hero --
        final hero = await btdRepo.fetchHero(id);

        List<List<NetworkImage>> heroImages = [];

        // -- Get Base Hero Images --
        heroImages.add([btdRepo.fetchHeroImage(id)]);
        heroImages[0]
            .addAll(btdRepo.fetchHeroLevelImages(hero.id, hero.skinChange));

        // if (hero.skins.isNotEmpty) {
        //   final skinsIds = hero.skins.map((str) => str.id).toList();
        //
        //   heroImages = skinsIds
        //       .map((id) => [btdRepo.fetchHeroBaseSkinImage(id, skinsIds[0])])
        //       .toList();
        //   for (int i = 1; i < heroImages.length; i++) {
        //     heroImages[i].addAll(btdRepo.fetchHeroSkinLevelImages(
        //         id, skinsIds[i - 1], hero.skinChange));
        //   }
        // }
        emit(HeroLoadedState(
          hero,
          heroImages,
        ));
        _dataFetched = true;
        _id = hero.id;
      }
    } on Exception catch (e) {
      // TODO add error page

      emit(HeroErrorState());
    }
  }
}
