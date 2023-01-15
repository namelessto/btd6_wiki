// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_tower.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeroTower _$HeroTowerFromJson(Map<String, dynamic> json) => HeroTower(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      (json['skinChange'] as List<dynamic>).map((e) => e as int).toList(),
      (json['skins'] as List<dynamic>)
          .map((e) => Skin.fromJson(e as Map<String, dynamic>))
          .toList(),
      Cost.fromJson(json['cost'] as Map<String, dynamic>),
      Stats.fromJson(json['stats'] as Map<String, dynamic>),
      Unlock.fromJson(json['unlock'] as Map<String, dynamic>),
      json['levelSpeed'] as String,
      (json['levels'] as List<dynamic>)
          .map((e) => Level.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HeroTowerToJson(HeroTower instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'skinChange': instance.skinChange,
      'skins': instance.skins.map((e) => e.toJson()).toList(),
      'cost': instance.cost.toJson(),
      'stats': instance.stats.toJson(),
      'unlock': instance.unlock.toJson(),
      'levelSpeed': instance.levelSpeed,
      'levels': instance.levels.map((e) => e.toJson()).toList(),
    };

Skin _$SkinFromJson(Map<String, dynamic> json) => Skin(
      json['id'] as String,
      json['name'] as String,
    );

Map<String, dynamic> _$SkinToJson(Skin instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Special _$SpecialFromJson(Map<String, dynamic> json) => Special(
      json['name'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$SpecialToJson(Special instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

Unlock _$UnlockFromJson(Map<String, dynamic> json) => Unlock(
      json['how'] as String,
      json['value'] as String,
    );

Map<String, dynamic> _$UnlockToJson(Unlock instance) => <String, dynamic>{
      'how': instance.how,
      'value': instance.value,
    };

Level _$LevelFromJson(Map<String, dynamic> json) => Level(
      json['level'] as int,
      json['description'] as String,
      json['xp'] as int,
      Rounds.fromJson(json['rounds'] as Map<String, dynamic>),
      (json['effects'] as List<dynamic>).map((e) => e as String).toList(),
      json['source'] as String,
    );

Map<String, dynamic> _$LevelToJson(Level instance) => <String, dynamic>{
      'level': instance.level,
      'description': instance.description,
      'xp': instance.xp,
      'rounds': instance.rounds,
      'effects': instance.effects,
      'source': instance.source,
    };

Rounds _$RoundsFromJson(Map<String, dynamic> json) => Rounds(
      json['easy'] as String,
      json['medium'] as String,
      json['hard'] as String,
      json['impoppable'] as String,
    );

Map<String, dynamic> _$RoundsToJson(Rounds instance) => <String, dynamic>{
      'easy': instance.easy,
      'medium': instance.medium,
      'hard': instance.hard,
      'impoppable': instance.impoppable,
    };
