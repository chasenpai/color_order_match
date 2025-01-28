// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecordImpl _$$RecordImplFromJson(Map<String, dynamic> json) => _$RecordImpl(
      classic: (json['classic'] as num).toInt(),
      pastel: (json['pastel'] as num).toInt(),
      neon: (json['neon'] as num).toInt(),
      vintage: (json['vintage'] as num).toInt(),
    );

Map<String, dynamic> _$$RecordImplToJson(_$RecordImpl instance) =>
    <String, dynamic>{
      'classic': instance.classic,
      'pastel': instance.pastel,
      'neon': instance.neon,
      'vintage': instance.vintage,
    };
