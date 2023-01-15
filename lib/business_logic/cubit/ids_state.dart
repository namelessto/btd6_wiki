part of 'ids_cubit.dart';

abstract class IdsState extends Equatable {
  const IdsState();
}

class IdsInitial extends IdsState {
  @override
  List<Object> get props => [];
}

class LoadingState extends IdsState {
  @override
  List<Object> get props => [];
}

class LoadedState extends IdsState {
  final List<String> towerIDS;
  final List<String> heroesIDS;
  final List<String> bloonsIDS;

  const LoadedState(
    this.towerIDS,
    this.heroesIDS,
    this.bloonsIDS,
  );

  @override
  List<Object> get props => [];
}

class ErrorState extends IdsState {
  @override
  List<Object> get props => [];
}
