class Chronique {
  final String title;
  final String chroniqueur;
  final String description;
  final int publicationDay;
  final String imageUrl;
  final String theme;
  bool isFavorite;
  int likes;
  int comment;

  Chronique({
    required this.title,
    required this.chroniqueur,
    required this.description,
    required this.publicationDay,
    required this.imageUrl,
    required this.theme,
    this.isFavorite = false,
    this.likes = 0,
    this.comment = 0,
  });
}