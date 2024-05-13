import 'package:ask_titmouse/app/routing.dart';
import 'package:ask_titmouse/entity/manager_deps.dart';
import 'package:ask_titmouse/entity/resource.dart';
import 'package:ask_titmouse/feature/resources/resources_manager.dart';
import 'package:ask_titmouse/repo/net_repo.dart';
import 'package:flutter/material.dart';

class UpdateResourceManager {
  final ManagerDeps deps;
  final NetRepo netRepo;
  final ResourcesManager resourcesManager;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int id = 0;
  bool isLoading = false;
  final TextEditingController nameC = TextEditingController();
  final TextEditingController urlC = TextEditingController();
  final TextEditingController descriptionC = TextEditingController();
  final TextEditingController synonymC = TextEditingController();

  UpdateResourceManager(
      {required this.deps,
      required this.netRepo,
      required this.resourcesManager});

  void setResource(Resource? resource) {
    if (resource != null) {
      id = resource.id!;
      nameC.text = resource.name;
      urlC.text = resource.url;
      descriptionC.text = resource.description;
      synonymC.text = resource.synonym ?? '';
    } else {
      id = 0;
      clearDescription();
      clearName();
      clearSynonym();
      clearUrl();
    }
  }

  void clearName() => nameC.clear();
  void clearUrl() => urlC.clear();
  void clearDescription() => descriptionC.clear();
  void clearSynonym() => synonymC.clear();

  Future<void> goBack() async => await deps.navKey.currentState!.pushReplacementNamed(AppRouter.resourcesPage);

  Future<void> updateResource() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      var newResource = Resource(
          id: id,
          name: nameC.text,
          url: urlC.text,
          description: descriptionC.text,
          synonym: synonymC.text);
      await resourcesManager.updateResource(newResource);
      nameC.clear();
      urlC.clear();
      descriptionC.clear();
      synonymC.clear();
      isLoading = false;
    }
  }
}
