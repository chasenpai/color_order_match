import 'package:color_order_match/data/entity/record_entity.dart';
import 'package:color_order_match/data/mapper/record_mapper.dart';
import 'package:color_order_match/domain/model/record.dart';
import 'package:color_order_match/domain/repository/record_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecordRepositoryImpl implements RecordRepository {

  @override
  Future<Record?> getRecord() async {
    final box = Hive.box('color_order_match.db');
    final RecordEntity? record = box.get('record');
    return record?.toModel();
  }

  @override
  Future<void> saveRecord(Record model) async {
    final record = model.toEntity();
    final box = Hive.box('color_order_match.db');
    await box.put('record', record);
  }

}