part of 'bloons_cubit.dart';

class BloonsState extends Equatable {
  const BloonsState({
    required this.bloons,
    required this.bosses,
    required this.bloonsImages,
    required this.bossesImages,
  });

  final List<Bloon> bloons;
  final List<Boss> bosses;
  final List<NetworkImage> bloonsImages;
  final List<NetworkImage> bossesImages;

  @override
  List<Object?> get props => [bloons, bosses, bloonsImages, bossesImages];
}
