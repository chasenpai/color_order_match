import 'package:color_order_match/domain/model/color_option.dart';
import 'package:flutter/animation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.freezed.dart';
part 'game_state.g.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    @Default(false) bool isStarted,
    @Default(false) bool isShowOrder,
    @Default(false) bool isWrong,
    @Default(false) bool isCorrect,
    @Default(false) bool isWatchAd,
    @Default(5) int showRemainingTime,
    @Default(0) int score,
    int? bestScore,
    @Default(3) int life,
    @JsonKey(includeFromJson: false) List<Color>? randomOrder,
    @JsonKey(includeFromJson: false) List<ColorOption>? shuffledOrder,
    @JsonKey(includeFromJson: false) List<Color>? userSelection,
  }) = _GameState;

  factory GameState.fromJson(Map<String, dynamic> json) => _$GameStateFromJson(json);
}