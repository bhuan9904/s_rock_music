import 'package:get_it/get_it.dart';
import 'package:s_rocks_music/home/home_view_model.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());
}
