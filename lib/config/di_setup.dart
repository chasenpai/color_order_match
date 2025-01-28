import 'package:color_order_match/data/repository/record_repository_impl.dart';
import 'package:color_order_match/domain/repository/record_repository.dart';
import 'package:color_order_match/presentation/game/game_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<RecordRepository>(RecordRepositoryImpl());
  getIt.registerFactory<GameViewModel>(() => GameViewModel(
    recordRepository: getIt(),
  ));
}