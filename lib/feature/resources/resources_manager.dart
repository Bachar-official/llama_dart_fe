import 'package:ask_titmouse/entity/manager_deps.dart';
import 'package:ask_titmouse/repo/net_repo.dart';

class ResourcesManager {
  final ManagerDeps deps;
  final NetRepo netRepo;

  const ResourcesManager({required this.deps, required this.netRepo});
}
