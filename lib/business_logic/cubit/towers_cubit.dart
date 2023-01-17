import 'package:bloc/bloc.dart';
import 'package:btd6_wiki/data/models/tower.dart';
import 'package:btd6_wiki/data/repositories/btd_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'towers_state.dart';

class TowersCubit extends Cubit<TowersState> {
  TowersCubit({required this.btdRepo})
      : super(const TowersState(towers: [], baseImages: []));

  final BTDRepo btdRepo;

  void initialTowers() async {
    try {
      List<Tower> towers = await btdRepo.fetchTowers();
      List<String> ids = await btdRepo.fetchTowersIDS();
      List<NetworkImage> images = btdRepo.fetchBaseTowersImages(ids);
      emit(TowersState(towers: towers, baseImages: images));
    } on Exception catch (e) {
      // TODO add error page

    }
  }

  // void loadTowersFromType(String type) async {
  //   try {
  //     if (_type != type) {
  //       List<Tower> towers = await btdRepo.fetchTowersFromType(type);
  //       List<String> ids = towers.map((tower) => tower.id).toList();
  //       List<NetworkImage> images = btdRepo.fetchBaseTowersImages(ids);
  //       emit(state.copyWith(towers: towers, baseImages: images));
  //       _type = type;
  //     }
  //   } on Exception catch (e) {
  //     // TODO
  //     print('$e in towers cubit towers types');
  //   }
  // }

}
