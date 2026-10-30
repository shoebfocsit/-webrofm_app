class Language {
  final int id;
  final String name;
  final String code;
  final String? icon;
  final bool isActive;

  const Language({
    required this.id,
    required this.name,
    required this.code,
    this.icon,
    required this.isActive,
  });
}
