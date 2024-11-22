import 'package:get_it/get_it.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
}
