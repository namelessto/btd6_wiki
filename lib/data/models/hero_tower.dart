import 'package:btd6_wiki/data/models/common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hero_tower.g.dart';

@JsonSerializable(explicitToJson: true)
class HeroTower {
  HeroTower(this.id, this.name, this.description, this.skinChange, this.skins,
      this.cost, this.stats, this.unlock, this.levelSpeed, this.levels);

  String id;
  String name;
  String description;
  List<int> skinChange;
  List<Skin> skins;
  Cost cost;
  Stats stats;
  Unlock unlock;
  String levelSpeed;
  List<Level> levels;

  factory HeroTower.fromJson(Map<String, dynamic> json) =>
      _$HeroTowerFromJson(json);
  Map<String, dynamic> toJson() => _$HeroTowerToJson(this);
}

@JsonSerializable()
class Skin {
  Skin(this.id, this.name);

  String id;
  String name;

  factory Skin.fromJson(Map<String, dynamic> json) => _$SkinFromJson(json);
  Map<String, dynamic> toJson() => _$SkinToJson(this);
}

@JsonSerializable()
class Special {
  Special(this.name, this.value);

  String name;
  String value;

  factory Special.fromJson(Map<String, dynamic> json) =>
      _$SpecialFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialToJson(this);
}

@JsonSerializable()
class Unlock {
  Unlock(this.how, this.value);

  String how;
  String value;

  factory Unlock.fromJson(Map<String, dynamic> json) => _$UnlockFromJson(json);
  Map<String, dynamic> toJson() => _$UnlockToJson(this);
}

@JsonSerializable()
class Level {
  Level(this.level, this.description, this.xp, this.rounds, this.effects,
      this.source);
  int level;
  String description;
  int xp;
  Rounds rounds;
  List<String> effects;
  String source;

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);
  Map<String, dynamic> toJson() => _$LevelToJson(this);
}

@JsonSerializable()
class Rounds {
  Rounds(
    this.easy,
    this.medium,
    this.hard,
    this.impoppable,
  );

  String easy;
  String medium;
  String hard;
  String impoppable;

  factory Rounds.fromJson(Map<String, dynamic> json) => _$RoundsFromJson(json);
  Map<String, dynamic> toJson() => _$RoundsToJson(this);
}
