import 'package:ask_titmouse/app/di.dart';
import 'package:ask_titmouse/feature/resources/components/resource_card.dart';
import 'package:ask_titmouse/feature/resources/resource_state.dart';
import 'package:ask_titmouse/feature/resources/resources_holder.dart';
import 'package:ask_titmouse/ui/containers/loading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final provider = StateNotifierProvider<ResourcesHolder, ResourcesState>(
    (ref) => di.resourcesHolder);

class ResourcesScreen extends ConsumerWidget {
  const ResourcesScreen({super.key});

  @override
  Widget build(context, ref) {
    final state = ref.watch(provider);
    final manager = di.resourcesManager;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ресурсы'),
        leading: IconButton(onPressed: manager.goBack, icon: const Icon(Icons.arrow_back),),
        actions: [
          TextButton(
            onPressed: manager.getResources,
            child: const Text('Обновить'),
          ),
          TextButton(
            onPressed: manager.restartModel,
            child: const Text('Перезапустить модель'),
          ),
        ],
      ),
      body: state.isLoading
          ? const Center(
              child: LoadingCard(),
            )
          : ListView.builder(
              itemCount: state.resources.length,
              itemBuilder: (ctx, index) => ResourceCard(
                  onTap: manager.goToEditResource,
                  resource: state.resources[index],
                  onDeleteResource: manager.removeResource),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: manager.goToNewResource,
        child: const Icon(Icons.add),
      ),
    );
  }
}
