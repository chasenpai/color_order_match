import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_option.freezed.dart';
part 'color_option.g.dart';

@freezed
class ColorOption with _$ColorOption {
  const factory ColorOption({
    @JsonKey(includeFromJson: false) Color? color,
    int? order,
  }) = _ColorOption;

  factory ColorOption.fromJson(Map<String, dynamic> json) => _$ColorOptionFromJson(json);
}