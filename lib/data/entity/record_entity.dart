import 'package:hive_flutter/hive_flutter.dart';

part 'record_entity.g.dart';

@HiveType(typeId: 0)
class RecordEntity extends HiveObject {
  @HiveField(0)
  int classic;
  @HiveField(1)
  int pastel;
  @HiveField(2)
  int neon;
  @HiveField(3)
  int vintage;

  RecordEntity({
    required this.classic,
    required this.pastel,
    required this.neon,
    required this.vintage,
  });
}