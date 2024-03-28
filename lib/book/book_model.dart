class Book {
  final String title;
  final String author;
  final String type;
  final String publicationDate;
  final String imageUrl;
  final String theme ;
  final String description;
  bool isFavorite;
  int likes;

  Book({
    required this.title,
    required this.author,
    required this.type,
    required this.publicationDate,
    required this.imageUrl,
    required this.theme,
    required this.description,
    this.isFavorite = false,
    this.likes = 0,
  });
}