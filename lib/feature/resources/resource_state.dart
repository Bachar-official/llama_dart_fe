import 'package:ask_titmouse/entity/resource.dart';
import 'package:flutter/material.dart';

@immutable
class ResourcesState {
  final bool isLoading;
  final List<Resource> resources;

  const ResourcesState({required this.isLoading, required this.resources});

  const ResourcesState.initial()
      : isLoading = false,
        resources = const [];

  ResourcesState copyWith({bool? isLoading, List<Resource>? resources}) =>
      ResourcesState(
          isLoading: isLoading ?? this.isLoading,
          resources: resources ?? this.resources);
}
