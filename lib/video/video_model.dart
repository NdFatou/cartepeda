// ignore: file_names
class VideoModel {
  final String videoUrl;
  final String videoImage;
  final String title;
  final String author;
  final String theme;
  final String type;
  final int views;
  final int likes;
  final int comments;
  final String description;
  final String publicateAt;
  VideoModel(
      {
        required this.videoUrl,
        required this.author,
        required this.videoImage,
        required this.title,
        required this.views,
        required this.likes,
        required this.comments,
        required this.description,
        required this.publicateAt,
        required this.theme,
        required this.type
      }
      );
}