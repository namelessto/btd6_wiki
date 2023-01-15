import 'package:bloc/bloc.dart';
import 'package:btd6_wiki/data/models/tower.dart';
import 'package:btd6_wiki/data/repositories/btd_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'tower_state.dart';

class TowerCubit extends Cubit<TowerState> {
  TowerCubit({required this.btdRepo}) : super(TowerInitialState());

  bool _dataFetched = false;
  String _id = '';

  final BTDRepo btdRepo;

  void setTower(String id) async {
    try {
      if (!_dataFetched || _id != id) {
        emit(TowerLoadingState());
        final tower = await btdRepo.fetchTower(id);
        final towerPaths = _paths(tower);
        final towerImage = btdRepo.fetchTowerImage(id);
        final towerPathsImages = btdRepo.fetchTowerPathsImages(id);
        emit(TowerLoadedState(tower, towerPaths, towerImage, towerPathsImages));
        _dataFetched = true;
        _id = tower.id;
      }
    } catch (e) {
      emit(TowerErrorState());
    }
  }

  void updateTower() {
    if (state is TowerLoadedState) {}
  }

  List<TowerPath> _paths(Tower tower) {
    List paths = List.from(Iterable.generate(5, (i) {
      return [
        tower.paths.path1[i],
        tower.paths.path2[i],
        tower.paths.path3[i],
      ];
    })).expand((element) => element).toList();
    return paths.cast<TowerPath>();
  }
}
