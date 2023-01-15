import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bloon.g.dart';

@JsonSerializable(explicitToJson: true)
class Bloon extends Equatable {
  final String id;
  final String name;
  final String type;
  final int rbe;
  final dynamic hp;
  final double speed;
  final List<BloonHierarchy> children;
  final List<BloonHierarchy> parents;
  final int? initialRound;
  final int? initialRoundABR;
  final List<String> immunities;
  final List<String> variants;

  const Bloon(
    this.id,
    this.name,
    this.type,
    this.rbe,
    this.hp,
    this.speed,
    this.children,
    this.parents,
    this.initialRound,
    this.initialRoundABR,
    this.immunities,
    this.variants,
  );

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        rbe,
        hp,
        speed,
        children,
        parents,
        initialRound,
        initialRoundABR,
        immunities,
        variants,
      ];

  factory Bloon.fromJson(Map<String, dynamic> json) => _$BloonFromJson(json);

  Map<String, dynamic> toJson() => _$BloonToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BloonHierarchy extends Equatable {
  final String id;
  final int? count;
  final String? type;

  const BloonHierarchy(
    this.id,
    this.count,
    this.type,
  );

  @override
  List<Object?> get props => [
        id,
        count,
        type,
      ];

  factory BloonHierarchy.fromJson(Map<String, dynamic> json) =>
      _$BloonHierarchyFromJson(json);

  Map<String, dynamic> toJson() => _$BloonHierarchyToJson(this);
}
