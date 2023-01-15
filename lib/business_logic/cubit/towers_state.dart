part of 'towers_cubit.dart';

class TowersState extends Equatable {
  const TowersState({required this.towers, required this.baseImages});

  final List<Tower> towers;
  final List<NetworkImage> baseImages;

  @override
  List<Object?> get props => [towers, baseImages];

  TowersState copyWith({List<Tower>? towers, List<NetworkImage>? baseImages}) {
    return TowersState(
        towers: towers ?? this.towers,
        baseImages: baseImages ?? this.baseImages);
  }
}
