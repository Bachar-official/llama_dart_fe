import 'package:ask_titmouse/app/di.dart';
import 'package:ask_titmouse/utils/validators.dart';
import 'package:flutter/material.dart';

class CreateResourceScreen extends StatelessWidget {
  const CreateResourceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final manager = di.createResourceManager;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Создание ресурса'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                maxLines: 10,
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
                onPressed: manager.createResource,
                child: const Text('Создать'),
              ),
              ElevatedButton(
                onPressed: manager.goBack,
                child: const Text('Отмена'),
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
