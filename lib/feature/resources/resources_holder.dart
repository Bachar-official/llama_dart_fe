import 'package:ask_titmouse/entity/resource.dart';
import 'package:ask_titmouse/feature/resources/resource_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResourcesHolder extends StateNotifier<ResourcesState> {
  ResourcesHolder() : super(const ResourcesState.initial());

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setResources(List<Resource> resources) {
    state = state.copyWith(resources: resources);
  }
}
