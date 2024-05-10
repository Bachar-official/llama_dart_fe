import 'dart:convert';

class Resource {
  final int? id;
  final String name;
  final String url;
  final String description;
  final String? synonym;

  const Resource(
      {this.id,
      required this.name,
      required this.url,
      required this.description,
      this.synonym});

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'url': url,
        'description': description,
        'synonym': synonym,
      };

  String toJson() => jsonEncode(toMap());

  factory Resource.fromMap(Map<String, dynamic> map) => Resource(
      id: map['id'],
      name: map['name'],
      url: map['url'],
      description: map['description'],
      synonym: map['synonym']);

  @override
  String toString() => 'Resource:\n'
      'id: $id;\n'
      'name: $name;\n'
      'url: $url;\n'
      'description: $description;\n'
      'synonym: $synonym.\n';
}
