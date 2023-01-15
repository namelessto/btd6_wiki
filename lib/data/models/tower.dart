import 'package:btd6_wiki/data/models/common.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tower.g.dart';

@JsonSerializable(explicitToJson: true)
class Tower extends Equatable {
  const Tower(
    this.id,
    this.name,
    this.description,
    this.type,
    this.cost,
    this.stats,
    this.footprint,
    this.defaultHotkey,
    this.paths,
  );

  final String id;
  final String name;
  final String description;
  final String type;
  final Cost cost;
  final Stats stats;
  final int footprint;
  final String defaultHotkey;
  final TowerPaths paths;

  @override
  List<Object> get props => [
        id,
        name,
        description,
        type,
        cost,
        stats,
        footprint,
        defaultHotkey,
        paths,
      ];

  factory Tower.fromJson(Map<String, dynamic> json) => _$TowerFromJson(json);
  Map<String, dynamic> toJson() => _$TowerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TowerPaths extends Equatable {
  const TowerPaths(
    this.path1,
    this.path2,
    this.path3,
    this.paragon,
  );

  final List<TowerPath> path1;
  final List<TowerPath> path2;
  final List<TowerPath> path3;
  final TowerPath? paragon;

  @override
  List<Object?> get props => [
        path1,
        path2,
        path3,
        paragon,
      ];

  factory TowerPaths.fromJson(Map<String, dynamic> json) =>
      _$TowerPathsFromJson(json);
  Map<String, dynamic> toJson() => _$TowerPathsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TowerPath extends Equatable {
  const TowerPath(
    this.name,
    this.description,
    this.cost,
    this.unlockXp,
    this.effects,
    this.source,
  );

  final String name;
  final String description;
  final Cost cost;
  final int unlockXp;
  final List<String> effects;
  final String? source;

  factory TowerPath.fromJson(Map<String, dynamic> json) =>
      _$TowerPathFromJson(json);
  Map<String, dynamic> toJson() => _$TowerPathToJson(this);

  @override
  List<Object?> get props => [
        name,
        description,
        cost,
        unlockXp,
        effects,
        source,
      ];
}
