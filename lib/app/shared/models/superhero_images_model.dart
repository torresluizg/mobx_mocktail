import 'dart:convert';

class SuperHeroImagesModel {
  final String xs;
  final String sm;
  final String md;
  final String lg;

  SuperHeroImagesModel(
    this.xs,
    this.sm,
    this.md,
    this.lg,
  );

  SuperHeroImagesModel copyWith({
    String? xs,
    String? sm,
    String? md,
    String? lg,
  }) {
    return SuperHeroImagesModel(
      xs ?? this.xs,
      sm ?? this.sm,
      md ?? this.md,
      lg ?? this.lg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'xs': xs,
      'sm': sm,
      'md': md,
      'lg': lg,
    };
  }

  factory SuperHeroImagesModel.fromMap(Map<String, dynamic> map) {
    return SuperHeroImagesModel(
      map['xs'],
      map['sm'],
      map['md'],
      map['lg'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SuperHeroImagesModel.fromJson(String source) =>
      SuperHeroImagesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SuperHeroImagesModel(xs: $xs, sm: $sm, md: $md, lg: $lg)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SuperHeroImagesModel &&
        other.xs == xs &&
        other.sm == sm &&
        other.md == md &&
        other.lg == lg;
  }

  @override
  int get hashCode {
    return xs.hashCode ^ sm.hashCode ^ md.hashCode ^ lg.hashCode;
  }
}
