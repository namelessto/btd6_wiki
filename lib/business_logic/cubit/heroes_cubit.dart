import 'package:bloc/bloc.dart';
import 'package:btd6_wiki/data/models/hero_tower.dart';
import 'package:btd6_wiki/data/repositories/btd_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'heroes_state.dart';

class HeroesCubit extends Cubit<HeroesState> {
  HeroesCubit({required this.btdRepo})
      : super(const HeroesState(heroes: [], baseImages: []));

  final BTDRepo btdRepo;

  void initialHeroes() async {
    try {
      List<HeroTower> heroes = await btdRepo.fetchHeroes();
      List<String> ids = await btdRepo.fetchHeroesIDS();
      List<NetworkImage> images = btdRepo.fetchBaseHeroesImages(ids);
      emit(HeroesState(heroes: heroes, baseImages: images));
    } on Exception catch (e) {
      // TODO
      print('$e in heroes cubit all towers');
    }
  }
}
