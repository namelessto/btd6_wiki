part of 'tower_cubit.dart';

@immutable
abstract class TowerState extends Equatable {
  const TowerState();
}

class TowerInitialState extends TowerState {
  @override
  List<Object?> get props => [];
}

class TowerLoadingState extends TowerState {
  @override
  List<Object> get props => [];
}

class TowerLoadedState extends TowerState {
  final Tower tower;
  final List<TowerPath> towerPaths;
  final NetworkImage towerImage;
  final List<NetworkImage> pathsImages;

  const TowerLoadedState(
    this.tower,
    this.towerPaths,
    this.towerImage,
    this.pathsImages,
  );

  @override
  List<Object?> get props => [tower];
}

class TowerErrorState extends TowerState {
  @override
  List<Object> get props => [];
}
