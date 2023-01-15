import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'boss.g.dart';

@JsonSerializable(explicitToJson: true)
class Boss extends Equatable {
  final String id;
  final String name;
  final String type;
  final RBE rbe;
  final double speed;
  final List children;
  final List parents;
  final List<String> rounds;
  final Test spawns;
  final List<String> immunities;
  final List variants;

  const Boss(
    this.id,
    this.name,
    this.type,
    this.rbe,
    this.speed,
    this.children,
    this.parents,
    this.rounds,
    this.spawns,
    this.immunities,
    this.variants,
  );

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        rbe,
        speed,
        children,
        parents,
        rounds,
        spawns,
        immunities,
        variants,
      ];

  factory Boss.fromJson(Map<String, dynamic> json) => _$BossFromJson(json);
  Map<String, dynamic> toJson() => _$BossToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RBE extends Equatable {
  final List<int> base;
  final List<int> elite;

  const RBE(this.base, this.elite);

  @override
  List<Object?> get props => [
        base,
        elite,
      ];

  factory RBE.fromJson(Map<String, dynamic> json) => _$RBEFromJson(json);
  Map<String, dynamic> toJson() => _$RBEToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Test extends Equatable {
  final List<Spawns> base;
  final List<Spawns> elite;

  const Test(this.base, this.elite);

  @override
  List<Object?> get props => [
        base,
        elite,
      ];

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);
  Map<String, dynamic> toJson() => _$TestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Spawns extends Equatable {
  final List<Spawn> scatter;
  final List<Spawn> skull;

  const Spawns(this.scatter, this.skull);

  @override
  List<Object?> get props => [
        scatter,
        skull,
      ];

  factory Spawns.fromJson(Map<String, dynamic> json) => _$SpawnsFromJson(json);
  Map<String, dynamic> toJson() => _$SpawnsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Spawn extends Equatable {
  final String bloon;
  final int count;
  final String? variant;

  const Spawn(this.bloon, this.count, this.variant);

  @override
  List<Object?> get props => [
        bloon,
        count,
      ];

  factory Spawn.fromJson(Map<String, dynamic> json) => _$SpawnFromJson(json);
  Map<String, dynamic> toJson() => _$SpawnToJson(this);
}
