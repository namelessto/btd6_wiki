part of 'heroes_cubit.dart';

class HeroesState extends Equatable {
  const HeroesState({required this.heroes, required this.baseImages});

  final List<HeroTower> heroes;
  final List<NetworkImage> baseImages;

  @override
  // TODO: implement props
  List<Object?> get props => [heroes, baseImages];
}
