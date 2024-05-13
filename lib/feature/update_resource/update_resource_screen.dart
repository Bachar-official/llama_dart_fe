import 'package:ask_titmouse/app/di.dart';
import 'package:ask_titmouse/entity/resource.dart';
import 'package:ask_titmouse/ui/containers/loading_card.dart';
import 'package:ask_titmouse/utils/validators.dart';
import 'package:flutter/material.dart';

class UpdateResourceScreen extends StatelessWidget {
  const UpdateResourceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resource = ModalRoute.of(context)!.settings.arguments as Resource;
    final manager = di.updateResourceManager;
    if (context.mounted) {
      manager.setResource(resource);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Редактирование ресурса ${resource.name}'),
      ),
      body: manager.isLoading
          ? const Center(child: LoadingCard())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: manager.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: manager.nameC,
                      validator: Validators.validateNull,
                      decoration: InputDecoration(
                        labelText: 'Название',
                        suffixIcon: IconButton(
                          onPressed: manager.clearName,
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: manager.synonymC,
                      decoration: InputDecoration(
                        labelText: 'Синонимы',
                        suffixIcon: IconButton(
                          onPressed: manager.clearSynonym,
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: manager.urlC,
                      validator: Validators.validateUrl,
                      decoration: InputDecoration(
                        labelText: 'Ссылка',
                        suffixIcon: IconButton(
                          onPressed: manager.clearUrl,
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: manager.descriptionC,
                      validator: Validators.validateNull,
                      decoration: InputDecoration(
                        labelText: 'Описание',
                        suffixIcon: IconButton(
                          onPressed: manager.clearDescription,
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: manager.updateResource,
                          child: const Text('Редактировать'),
                        ),
                        ElevatedButton(
                          onPressed: manager.goBack,
                          child: const Text('Назад'),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
    );
  }
}
