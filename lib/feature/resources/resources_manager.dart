import 'package:ask_titmouse/app/routing.dart';
import 'package:ask_titmouse/entity/manager_deps.dart';
import 'package:ask_titmouse/entity/resource.dart';
import 'package:ask_titmouse/entity/snackbar_reason.dart';
import 'package:ask_titmouse/feature/resources/resources_holder.dart';
import 'package:ask_titmouse/repo/net_repo.dart';
import 'package:ask_titmouse/utils/show_snackbar.dart';

class ResourcesManager {
  final ManagerDeps deps;
  final NetRepo netRepo;
  final ResourcesHolder holder;

  ResourcesManager({
    required this.deps,
    required this.netRepo,
    required this.holder,
  }) {
    getResources();
  }

  void setLoading(bool isLoading) => holder.setLoading(isLoading);

  Future<void> goToNewResource() async {
    await deps.navKey.currentState!.pushNamed(AppRouter.createResourcePage);
  }

  Future<void> goToEditResource(Resource resource) async {
    await deps.navKey.currentState!
        .pushNamed(AppRouter.editResourcePage, arguments: resource);
  }

  Future<void> getResources() async {
    deps.logger.d('Getting all resources');
    try {
      setLoading(true);
      var res = await netRepo.getResources();
      holder.setResources(res);
      deps.logger.i('Resources gets successfully');
    } catch (e) {
      deps.logger.e('Error while getting resources: $e');
      showSnackBar(
          deps: deps,
          reason: SnackBarReason.error,
          message: 'Ошибка при получении ресурсов: $e');
    } finally {
      setLoading(false);
    }
  }

  Future<void> removeResource(Resource resource) async {
    deps.logger.d('Removing resource ${resource.id}');
    try {
      setLoading(true);
      var res = await netRepo.deleteResource(resource);
      if (res) {
        getResources();
      } else {
        showSnackBar(
            deps: deps,
            reason: SnackBarReason.warning,
            message: 'Что-то пошло не так');
      }
    } catch (e) {
      deps.logger.e('Error while deleting resource: $e');
      showSnackBar(
          deps: deps,
          reason: SnackBarReason.error,
          message: 'Ошибка при удалении ресурса: $e');
    } finally {
      setLoading(false);
    }
  }

  Future<void> updateResource(Resource resource) async {
    deps.logger.d('Updating resource ${resource.id}');
    try {
      setLoading(true);
      var res = await netRepo.updateResource(resource);
      if (res) {
        getResources();
        deps.navKey.currentState!.popAndPushNamed(AppRouter.resourcesPage);
      } else {
        showSnackBar(
            deps: deps,
            reason: SnackBarReason.warning,
            message: 'Что-то пошло не так');
      }
    } catch (e) {
      deps.logger.e('Error while updating resource: $e');
      showSnackBar(
          deps: deps,
          reason: SnackBarReason.error,
          message: 'Ошибка при обновлении ресурса: $e');
    } finally {
      setLoading(false);
    }
  }

  Future<void> createResource(Resource resource) async {
    deps.logger.d('Creating resource ${resource.id}');
    try {
      setLoading(true);
      var res = await netRepo.createResource(resource);
      if (res) {
        getResources();
        deps.navKey.currentState!.popAndPushNamed(AppRouter.resourcesPage);
      } else {
        showSnackBar(
            deps: deps,
            reason: SnackBarReason.warning,
            message: 'Что-то пошло не так');
      }
    } catch (e) {
      deps.logger.e('Error while creating resource: $e');
      showSnackBar(
          deps: deps,
          reason: SnackBarReason.error,
          message: 'Ошибка при создании ресурса: $e');
    } finally {
      setLoading(false);
    }
  }

  Future<void> restartModel() async {
    deps.logger.d('Tring to restart model');
    try {
      setLoading(true);
      var res = await netRepo.restartModel();
      if (res) {
        showSnackBar(
            deps: deps,
            reason: SnackBarReason.success,
            message: 'Модель перезапущена!');
      } else {
        showSnackBar(
            deps: deps,
            reason: SnackBarReason.warning,
            message: 'Что-то пошло не так');
      }
    } catch (e) {
      deps.logger.e('Error while restarting model: $e');
      showSnackBar(
          deps: deps,
          reason: SnackBarReason.error,
          message: 'Ошибка при перезапуске модели: $e');
    } finally {
      setLoading(false);
    }
  }
}
