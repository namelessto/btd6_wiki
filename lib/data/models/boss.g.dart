// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boss.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Boss _$BossFromJson(Map<String, dynamic> json) => Boss(
      json['id'] as String,
      json['name'] as String,
      json['type'] as String,
      RBE.fromJson(json['rbe'] as Map<String, dynamic>),
      (json['speed'] as num).toDouble(),
      json['children'] as List<dynamic>,
      json['parents'] as List<dynamic>,
      (json['rounds'] as List<dynamic>).map((e) => e as String).toList(),
      Test.fromJson(json['spawns'] as Map<String, dynamic>),
      (json['immunities'] as List<dynamic>).map((e) => e as String).toList(),
      json['variants'] as List<dynamic>,
    );

Map<String, dynamic> _$BossToJson(Boss instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'rbe': instance.rbe.toJson(),
      'speed': instance.speed,
      'children': instance.children,
      'parents': instance.parents,
      'rounds': instance.rounds,
      'spawns': instance.spawns.toJson(),
      'immunities': instance.immunities,
      'variants': instance.variants,
    };

RBE _$RBEFromJson(Map<String, dynamic> json) => RBE(
      (json['base'] as List<dynamic>).map((e) => e as int).toList(),
      (json['elite'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$RBEToJson(RBE instance) => <String, dynamic>{
      'base': instance.base,
      'elite': instance.elite,
    };

Test _$TestFromJson(Map<String, dynamic> json) => Test(
      (json['base'] as List<dynamic>)
          .map((e) => Spawns.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['elite'] as List<dynamic>)
          .map((e) => Spawns.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TestToJson(Test instance) => <String, dynamic>{
      'base': instance.base.map((e) => e.toJson()).toList(),
      'elite': instance.elite.map((e) => e.toJson()).toList(),
    };

Spawns _$SpawnsFromJson(Map<String, dynamic> json) => Spawns(
      (json['scatter'] as List<dynamic>)
          .map((e) => Spawn.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['skull'] as List<dynamic>)
          .map((e) => Spawn.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpawnsToJson(Spawns instance) => <String, dynamic>{
      'scatter': instance.scatter.map((e) => e.toJson()).toList(),
      'skull': instance.skull.map((e) => e.toJson()).toList(),
    };

Spawn _$SpawnFromJson(Map<String, dynamic> json) => Spawn(
      json['bloon'] as String,
      json['count'] as int,
      json['variant'] as String?,
    );

Map<String, dynamic> _$SpawnToJson(Spawn instance) => <String, dynamic>{
      'bloon': instance.bloon,
      'count': instance.count,
      'variant': instance.variant,
    };
