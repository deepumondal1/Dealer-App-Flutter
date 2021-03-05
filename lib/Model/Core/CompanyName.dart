import 'dart:convert';

class CompanyName {
  final int id;
  final String name;
  final String description;
  final DateTime created_at;
  final DateTime updated_at;

  CompanyName({
    this.id,
    this.name,
    this.description,
    this.created_at,
    this.updated_at,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      // 'created_at': created_at?.millisecondsSinceEpoch,
      // 'updated_at': updated_at?.millisecondsSinceEpoch,
    };
  }

  factory CompanyName.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return CompanyName(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      created_at: DateTime.parse(map['created_at']),
      updated_at: DateTime.parse(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyName.fromJson(String source) =>
      CompanyName.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CompanyName(id: $id, name: $name, description: $description, created_at: $created_at, updated_at: $updated_at)';
  }
}
