class ShowCategory {
  final String id;
  final String name;
  final String? icon;
  final int showCount;
  final String? gradient;

  const ShowCategory({
    required this.id,
    required this.name,
    this.icon,
    this.showCount = 0,
    this.gradient,
  });

  ShowCategory copyWith({
    String? id,
    String? name,
    String? icon,
    int? showCount,
    String? gradient,
  }) {
    return ShowCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      showCount: showCount ?? this.showCount,
      gradient: gradient ?? this.gradient,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
        'show_count': showCount,
        'gradient': gradient,
      };

  factory ShowCategory.fromJson(Map<String, dynamic> json) => ShowCategory(
        id: json['id'] as String,
        name: json['name'] as String,
        icon: json['icon'] as String?,
        showCount: (json['show_count'] as num?)?.toInt() ?? 0,
        gradient: json['gradient'] as String?,
      );
}
