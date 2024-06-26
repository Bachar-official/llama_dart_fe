import 'package:ask_titmouse/entity/resource.dart';
import 'package:flutter/material.dart';

class ResourceCard extends StatelessWidget {
  final Resource resource;
  final Future<void> Function(Resource) onDeleteResource;
  final Future<void> Function(Resource) onTap;
  const ResourceCard(
      {super.key,
      required this.resource,
      required this.onDeleteResource,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(resource),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(resource.name),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => onDeleteResource(resource),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
