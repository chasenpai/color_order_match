import 'package:color_order_match/domain/model/record.dart';

abstract interface class RecordRepository {

  Future<Record?> getRecord();

  Future<void> saveRecord(Record model);

}