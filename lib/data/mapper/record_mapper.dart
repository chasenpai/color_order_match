import 'package:color_order_match/domain/model/record.dart';
import 'package:color_order_match/data/entity/record_entity.dart';

extension RecordEntityToModel on RecordEntity {
  Record toModel() {
    return Record(
      classic: classic,
      pastel: pastel,
      neon: neon,
      vintage: vintage,
    );
  }
}

extension RecordModelToEntity on Record {
  RecordEntity toEntity() {
    return RecordEntity(
      classic: classic,
      pastel: pastel,
      neon: neon,
      vintage: vintage,
    );
  }
}
