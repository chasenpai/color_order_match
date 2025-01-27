import 'package:color_order_match/presentation/game/game_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerFactory<GameViewModel>(() => GameViewModel());
}