part of 'bloon_cubit.dart';

abstract class BloonState extends Equatable {
  const BloonState();
}

class BloonInitialState extends BloonState {
  @override
  List<Object?> get props => [];
}

class BloonLoadingState extends BloonState {
  @override
  List<Object> get props => [];
}

class BloonLoadedState extends BloonState {
  final Bloon bloon;
  final List<NetworkImage> bloonImages;
  final List<Bloon> children;
  final List<NetworkImage> childrenImages;
  final List<Bloon> parents;
  final List<NetworkImage> parentsImages;

  const BloonLoadedState(
    this.bloon,
    this.bloonImages,
    this.children,
    this.childrenImages,
    this.parents,
    this.parentsImages,
  );

  @override
  List<Object?> get props => [
        bloon,
        bloonImages,
        children,
        childrenImages,
        parents,
        parentsImages,
      ];
}

class BloonErrorState extends BloonState {
  @override
  List<Object> get props => [];
}
