import 'package:ask_titmouse/app/routing.dart';
import 'package:ask_titmouse/entity/manager_deps.dart';
import 'package:ask_titmouse/entity/resource.dart';
import 'package:ask_titmouse/feature/resources/resources_manager.dart';
import 'package:ask_titmouse/repo/net_repo.dart';
import 'package:flutter/material.dart';

class CreateResourceManager {
  final ManagerDeps deps;
  final NetRepo netRepo;
  final ResourcesManager resourcesManager;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController urlC = TextEditingController();
  final TextEditingController descriptionC = TextEditingController();
  final TextEditingController synonymC = TextEditingController();

  CreateResourceManager(
      {required this.deps,
      required this.netRepo,
      required this.resourcesManager});

  void clearName() => nameC.clear();
  void clearUrl() => urlC.clear();
  void clearDescription() => descriptionC.clear();
  void clearSynonym() => synonymC.clear();

  Future<void> goBack() async => await deps.navKey.currentState!.pushReplacementNamed(AppRouter.resourcesPage);

  Future<void> createResource() async {
    if (formKey.currentState!.validate()) {
      var newResource = Resource(
          name: nameC.text,
          url: urlC.text,
          description: descriptionC.text,
          synonym: synonymC.text);      
      await resourcesManager.createResource(newResource);
      nameC.clear();
      urlC.clear();
      descriptionC.clear();
      synonymC.clear();
    }
  }
}
