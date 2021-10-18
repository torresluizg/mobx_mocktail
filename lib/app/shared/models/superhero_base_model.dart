import 'dart:convert';

import 'package:getx_mockitail/app/shared/models/superhero_images_model.dart';

class SuperHeroBaseModel {
  final int id;
  final String name;
  final String slug;
  final SuperHeroImagesModel images;

  SuperHeroBaseModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.images,
  });

  SuperHeroBaseModel copyWith({
    int? id,
    String? name,
    String? slug,
    SuperHeroImagesModel? images,
  }) {
    return SuperHeroBaseModel(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'images': images.toMap(),
    };
  }

  factory SuperHeroBaseModel.fromMap(Map<String, dynamic> map) {
    return SuperHeroBaseModel(
      id: map['id'],
      name: map['name'],
      slug: map['slug'],
      images: SuperHeroImagesModel.fromMap(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SuperHeroBaseModel.fromJson(String source) =>
      SuperHeroBaseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SuperHeroBaseModel(id: $id, name: $name, slug: $slug, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SuperHeroBaseModel &&
        other.id == id &&
        other.name == name &&
        other.slug == slug &&
        other.images == images;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ slug.hashCode ^ images.hashCode;
  }
}
