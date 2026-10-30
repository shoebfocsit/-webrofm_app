class Teaser {
  final int id;
  final String title;
  final String? imageUrl;
  final int sequence;
  final bool isActive;
  final bool isConverted;
  final DateTime createdAt;

  const Teaser({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.sequence,
    required this.isActive,
    required this.isConverted,
    required this.createdAt,
  });
}
