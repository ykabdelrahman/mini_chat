import 'package:get_it/get_it.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/home/data/repos/groups_repo.dart';
import '../../features/home/data/repos/groups_repo_impl.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/new_group/data/repos/new_group_repo.dart';
import '../../features/new_group/data/repos/new_group_repo_impl.dart';
import '../../features/search/data/repos/search_repo.dart';
import '../../features/search/data/repos/search_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl());

  getIt.registerSingleton<HomeRepo>(HomeRepoImpl());

  getIt.registerSingleton<GroupsRepo>(GroupsRepoImpl());

  getIt.registerSingleton<SearchRepo>(SearchRepoImpl());

  getIt.registerSingleton<NewGroupRepo>(NewGroupRepoImpl());
}
