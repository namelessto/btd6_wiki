// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cost _$CostFromJson(Map<String, dynamic> json) => Cost(
      json['easy'] as int,
      json['medium'] as int,
      json['hard'] as int,
      json['impoppable'] as int,
    );

Map<String, dynamic> _$CostToJson(Cost instance) => <String, dynamic>{
      'easy': instance.easy,
      'medium': instance.medium,
      'hard': instance.hard,
      'impoppable': instance.impoppable,
    };

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      json['damage'] as String,
      json['pierce'] as String,
      json['attackSpeed'] as String,
      json['range'] as String,
      json['type'] as String,
      (json['special'] as List<dynamic>?)
          ?.map((e) => Special.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'damage': instance.damage,
      'pierce': instance.pierce,
      'attackSpeed': instance.attackSpeed,
      'range': instance.range,
      'type': instance.type,
      'special': instance.special?.map((e) => e.toJson()).toList(),
    };
