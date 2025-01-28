// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameStateImpl _$$GameStateImplFromJson(Map<String, dynamic> json) =>
    _$GameStateImpl(
      isStarted: json['isStarted'] as bool? ?? false,
      isShowOrder: json['isShowOrder'] as bool? ?? false,
      isWrong: json['isWrong'] as bool? ?? false,
      isCorrect: json['isCorrect'] as bool? ?? false,
      isLifeAdWatched: json['isLifeAdWatched'] as bool? ?? false,
      isHintAdWatched: json['isHintAdWatched'] as bool? ?? false,
      showRemainingTime: (json['showRemainingTime'] as num?)?.toInt() ?? 5,
      score: (json['score'] as num?)?.toInt() ?? 0,
      bestScore: (json['bestScore'] as num?)?.toInt(),
      life: (json['life'] as num?)?.toInt() ?? 3,
      hint: (json['hint'] as num?)?.toInt() ?? 3,
    );

Map<String, dynamic> _$$GameStateImplToJson(_$GameStateImpl instance) =>
    <String, dynamic>{
      'isStarted': instance.isStarted,
      'isShowOrder': instance.isShowOrder,
      'isWrong': instance.isWrong,
      'isCorrect': instance.isCorrect,
      'isLifeAdWatched': instance.isLifeAdWatched,
      'isHintAdWatched': instance.isHintAdWatched,
      'showRemainingTime': instance.showRemainingTime,
      'score': instance.score,
      'bestScore': instance.bestScore,
      'life': instance.life,
      'hint': instance.hint,
    };
