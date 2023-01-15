part of 'hero_cubit.dart';

abstract class HeroState extends Equatable {
  const HeroState();
}

class HeroInitialState extends HeroState {
  @override
  List<Object> get props => [];
}

class HeroLoadingState extends HeroState {
  @override
  List<Object> get props => [];
}

class HeroLoadedState extends HeroState {
  final HeroTower hero;
  final List<List<NetworkImage>> heroImages;

  const HeroLoadedState(
    this.hero,
    this.heroImages,
  );

  @override
  List<Object?> get props => [hero];
}

class HeroErrorState extends HeroState {
  @override
  List<Object> get props => [];
}
