import 'package:btd6_wiki/data/models/hero_tower.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'common.g.dart';

@JsonSerializable()
class Cost extends Equatable {
  const Cost(
    this.easy,
    this.medium,
    this.hard,
    this.impoppable,
  );

  final int easy;
  final int medium;
  final int hard;
  final int impoppable;

  factory Cost.fromJson(Map<String, dynamic> json) => _$CostFromJson(json);
  Map<String, dynamic> toJson() => _$CostToJson(this);

  @override
  List<Object?> get props => [
        easy,
        medium,
        hard,
        impoppable,
      ];
}

@JsonSerializable(explicitToJson: true)
class Stats extends Equatable {
  const Stats(
    this.damage,
    this.pierce,
    this.attackSpeed,
    this.range,
    this.type,
    this.special,
  );

  final String damage;
  final String pierce;
  final String attackSpeed;
  final String range;
  final String type;
  final List<Special>? special;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
  Map<String, dynamic> toJson() => _$StatsToJson(this);

  @override
  List<Object?> get props => [
        damage,
        pierce,
        attackSpeed,
        range,
        type,
        special,
      ];
}
