// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bloon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bloon _$BloonFromJson(Map<String, dynamic> json) => Bloon(
      json['id'] as String,
      json['name'] as String,
      json['type'] as String,
      json['rbe'] as int,
      json['hp'],
      (json['speed'] as num).toDouble(),
      (json['children'] as List<dynamic>)
          .map((e) => BloonHierarchy.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['parents'] as List<dynamic>)
          .map((e) => BloonHierarchy.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['initialRound'] as int?,
      json['initialRoundABR'] as int?,
      (json['immunities'] as List<dynamic>).map((e) => e as String).toList(),
      (json['variants'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BloonToJson(Bloon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'rbe': instance.rbe,
      'hp': instance.hp,
      'speed': instance.speed,
      'children': instance.children.map((e) => e.toJson()).toList(),
      'parents': instance.parents.map((e) => e.toJson()).toList(),
      'initialRound': instance.initialRound,
      'initialRoundABR': instance.initialRoundABR,
      'immunities': instance.immunities,
      'variants': instance.variants,
    };

BloonHierarchy _$BloonHierarchyFromJson(Map<String, dynamic> json) =>
    BloonHierarchy(
      json['id'] as String,
      json['count'] as int?,
      json['type'] as String?,
    );

Map<String, dynamic> _$BloonHierarchyToJson(BloonHierarchy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'type': instance.type,
    };
