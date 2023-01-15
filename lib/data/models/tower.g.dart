// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tower.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tower _$TowerFromJson(Map<String, dynamic> json) => Tower(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      json['type'] as String,
      Cost.fromJson(json['cost'] as Map<String, dynamic>),
      Stats.fromJson(json['stats'] as Map<String, dynamic>),
      json['footprint'] as int,
      json['defaultHotkey'] as String,
      TowerPaths.fromJson(json['paths'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TowerToJson(Tower instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'cost': instance.cost.toJson(),
      'stats': instance.stats.toJson(),
      'footprint': instance.footprint,
      'defaultHotkey': instance.defaultHotkey,
      'paths': instance.paths.toJson(),
    };

TowerPaths _$TowerPathsFromJson(Map<String, dynamic> json) => TowerPaths(
      (json['path1'] as List<dynamic>)
          .map((e) => TowerPath.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['path2'] as List<dynamic>)
          .map((e) => TowerPath.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['path3'] as List<dynamic>)
          .map((e) => TowerPath.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['paragon'] == null
          ? null
          : TowerPath.fromJson(json['paragon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TowerPathsToJson(TowerPaths instance) =>
    <String, dynamic>{
      'path1': instance.path1.map((e) => e.toJson()).toList(),
      'path2': instance.path2.map((e) => e.toJson()).toList(),
      'path3': instance.path3.map((e) => e.toJson()).toList(),
      'paragon': instance.paragon?.toJson(),
    };

TowerPath _$TowerPathFromJson(Map<String, dynamic> json) => TowerPath(
      json['name'] as String,
      json['description'] as String,
      Cost.fromJson(json['cost'] as Map<String, dynamic>),
      json['unlockXp'] as int,
      (json['effects'] as List<dynamic>).map((e) => e as String).toList(),
      json['source'] as String?,
    );

Map<String, dynamic> _$TowerPathToJson(TowerPath instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'cost': instance.cost.toJson(),
      'unlockXp': instance.unlockXp,
      'effects': instance.effects,
      'source': instance.source,
    };
