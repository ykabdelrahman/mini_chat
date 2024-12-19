import 'package:get_it/get_it.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/search/data/repos/search_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl());

  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl());
}
